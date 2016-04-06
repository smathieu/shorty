defmodule Shorty.PageController do
  use Shorty.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
