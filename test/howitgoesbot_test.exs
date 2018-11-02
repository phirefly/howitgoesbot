defmodule HowitgoesbotTest do
  use ExUnit.Case
  use Plug.Test

  doctest Howitgoesbot
  alias Howitgoesbot.Router

  @opts Router.init([])

  test "responds to greeting" do
    conn = conn(:post, "/webhook", "")
           |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "ohai"
  end
end
