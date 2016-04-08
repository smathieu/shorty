defmodule Shorty.ShortcodeController do
  def generate do
    chars = to_list(?a .. ?z) ++
      to_list(?A .. ?Z) ++
      Enum.map(Enum.to_list(0..9), &Integer.to_string/1)

    build_list(8, chars)
  end

  defp to_list(range) do
    String.codepoints(to_string(Enum.to_list(range)))
  end

  defp build_list(0, _) do
    ""
  end

  defp build_list(n, chars) do
    Enum.random(chars) <> build_list(n - 1, chars)
  end
end
