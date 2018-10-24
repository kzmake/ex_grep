defmodule Exgrep do
  @moduledoc false
  alias Egrep.Methods

  def main(["enum" | commands] = _args) do
    {file_name, query} = parse_command(commands)

    file_name
    |> Methods.enum(query)
  end

  def main(["stream" | commands] = _args) do
    {file_name, query} = parse_command(commands)

    file_name
    |> Methods.stream(query)
  end

  def main(["flow" | commands] = _args) do
    {file_name, query} = parse_command(commands)

    file_name
    |> Methods.flow(query)
  end

  defp parse_command([file_name | querys] = _commands) do
    [query | _] = querys
    {file_name, query}
  end
end
