defmodule Metascope.GeventController do
  use Metascope.Web, :controller

  def index(conn, _params) do
    json conn, %{"foo" => "bar"}
  end
end
