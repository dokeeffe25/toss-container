defmodule TossContainerTest do
  use ExUnit.Case
  doctest TossContainer

  test "greets the world" do
    assert TossContainer.hello() == :world
  end
end
