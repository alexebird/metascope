defmodule Metascope.GeventController do
  use Metascope.Web, :controller

  def index(conn, _params) do
    json conn, Elixir.EventStream |> EventStream.last_gevent
  end
end
