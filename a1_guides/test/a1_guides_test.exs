defmodule A1GuidesTest do
  use ExUnit.Case
  doctest A1Guides

  test "greets the world" do
    assert A1Guides.hello() == :world
  end
end
