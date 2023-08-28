defmodule ErrorGeneratorTest do
  use ExUnit.Case
  doctest ErrorGenerator

  test "greets the world" do
    assert ErrorGenerator.hello() == :world
  end
end
