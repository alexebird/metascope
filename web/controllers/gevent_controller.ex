defmodule Metascope.GeventController do
  use Metascope.Web, :controller

  def index(conn, _params) do
    json conn, Elixir.Metascope.EventStream |> Metascope.EventStream.last_gevent
  end
end
