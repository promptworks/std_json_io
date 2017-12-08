defmodule StdJsonIo.JsonUtils do
  # Todo:
  # improve this. Since we're decoding it here,
  # we can already return the data.
  #
  def complete_json?(json_string, []) do
    case Poison.decode(json_string) do
      {:ok, _data} -> true
      _ -> false
    end
  end

  def complete_json?(json_string, buffer) do
    json = Enum.reverse([json_string|buffer])
    complete_json?(json, [])
  end


  def package_complete_json(json, [] = _buff) do
    [json]
  end

  def package_complete_json(json, buffer) do
    Enum.reverse([json|buffer])
  end

  def wrap_incomplete_json(json, [] = _buff) do
    [json]
  end

  def wrap_incomplete_json(json, buffer) do
    [json|buffer]
  end
end
