defmodule GitStreamer do
  use GenServer

  @auth [{"Authorization", "token #{System.get_env("GH_READ_TOKEN")}"}]

  #xx |> Map.get(:body) |> Poison.decode!
  #xx = HTTPoison.get!("https://api.github.com/users/grh-drone/events/orgs/ConsultingMD",

  [{"If-None-Match", "\"0951fdd0b296e4402a0f3b56d9f63aae\""}]

  def start_link do
    GenServer.start_link(
      __MODULE__,
      {:ok, Tentacat.Client.new(%{access_token: System.get_env("GH_READ_TOKEN")})}
    )
  end

  # Public API

  def client(server) do
    GenServer.call(server, :client)
  end

  def pull_requests(server) do
    GenServer.call(server, :pull_requests)
  end

  # GenServer callbacks

  def init(_) do
    nil
  end

  def handle_call(:client, _from, client) do
    user = Tentacat.Users.me(client)
    #IO.inspect(user)
    {:reply, {:ok, user}, client}
  end
end
