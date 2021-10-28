defmodule DisabledChangeEventWeb.PageController do
  use DisabledChangeEventWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
