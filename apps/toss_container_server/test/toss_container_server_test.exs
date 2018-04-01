defmodule TossContainerServerTest do
  use ExUnit.Case
  doctest TossContainerServer

  test "greets the world" do
    assert TossContainerServer.hello() == :world
  end
end
