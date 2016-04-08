defmodule Shorty.ShortcodeControllerTest do
  use ExUnit.Case

  alias Shorty.ShortcodeController
  test "it generates a correctly formatted short code" do
    code = ShortcodeController.generate
    assert String.length(code) == 8
    assert Regex.match?(~r/[a-zA-Z0-9]{8}/, code)
  end

  test "two shortcodes aren't the same" do
    code1 = ShortcodeController.generate
    code2 = ShortcodeController.generate
    assert code1 != code2
  end
end
