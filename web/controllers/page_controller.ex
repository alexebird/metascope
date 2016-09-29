defmodule Metascope.PageController do
  use Metascope.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
