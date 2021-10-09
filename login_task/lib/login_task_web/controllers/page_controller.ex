defmodule LoginTaskWeb.PageController do
  use LoginTaskWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
