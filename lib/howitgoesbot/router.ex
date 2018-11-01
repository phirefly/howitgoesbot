defmodule Howitgoesbot.Router do
  use Plug.Router
  use Plug.Debugger, otp_app: :howitgoesbot

  plug Plug.Logger
  plug Plug.Parsers, parsers: [:json, :urlencoded],
                     pass: ["text/*"],
                     json_decoder: Poison
  plug :match
  plug :dispatch

  post "/webhook" do
    send_resp(conn, 200, "ohai")
  end

  match _ do
    send_resp(conn, 404, "not_found")
  end
end