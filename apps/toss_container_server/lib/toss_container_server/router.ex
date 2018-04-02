defmodule TossContainerServer.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/hello" do
    IO.puts("HERE")
    send_resp(conn, 200, "world")
  end

  delete "/delete" do
    IO.puts("DELETE REQUEST")
    send_resp(conn, 200, "successful")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
