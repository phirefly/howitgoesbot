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
    # send_resp(conn, 200, conn.body_params["challenge"]) #---> Verifies Slackbot API
    # IO.puts inspect conn.body_params

    params = conn.body_params
    case params["text"] do
       "list" -> send_resp(conn, 200, ~s({"text":"Here is your list..."}))
       "help" -> send_resp(conn, 200, ~s({"text":"Right away!"}))
       "start" -> send_resp(conn, 200, ~s({"text":"Alrighty. Let's begin..."}))
       _ -> send_resp(conn, 200, ~s({"text":"Catch all from HigBot"}))
    end
  end

  match _ do
    send_resp(conn, 404, "not_found")
  end
end