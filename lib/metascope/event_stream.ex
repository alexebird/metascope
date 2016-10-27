#require IEx;

defmodule Metascope.EventStream do
  use GenServer

  @auth [{"Authorization", "token #{Application.get_env(:metascope, :github_token)}"}]
  @events_url "https://api.github.com/users/alexebird/events/orgs/birdart"
  @default_state %{last_etag: nil, gevents: []}

  def start_link do
    GenServer.start_link(__MODULE__, @default_state, name: __MODULE__)
  end

  # Public API

  def poll(server) do
    GenServer.cast(server, :poll)
  end

  def last_etag(server) do
    GenServer.call(server, :last_etag)
  end

  def last_gevent(server) do
    GenServer.call(server, :last_gevent)
  end

  # GenServer callbacks

  def handle_cast(:poll, state) do
    {:noreply, get_events(state)}
  end

  def handle_call(:last_etag, _from, state) do
    {:reply, state[:last_etag], state}
  end

  def handle_call(:last_gevent, _from, state) do
    last = state[:gevents] |> List.last
    {:reply, last, state}
  end

  # public parts

  def get_events(state \\ @default_state) do
    resp = HTTPoison.get!(@events_url, headers(state[:last_etag]))
    state
      |> Map.put(:last_etag, etag(resp))
      |> Map.update(:gevents, [], &(&1 ++ body(resp)))
  end

  # private parts

  defp body(resp) do
    {:ok, json} = resp
      |> Map.get(:body)
      |> Poison.decode
    json
  end

  defp etag(resp) do
    resp
      |> Map.get(:headers)
      |> Enum.into(%{})
      |> Map.get("ETag")
  end

  defp headers(nil) do
    @auth
  end

  defp headers(etag) do
    @auth ++ [{"If-None-Match", etag}]
  end
end
