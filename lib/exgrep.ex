defmodule Exgrep do
  @moduledoc false
  alias Egrep.Methods

  def main(["enum" | commands] = _args) do
    {file_name, regex} = parse_command(commands)

    file_name
    |> Methods.enum(regex)
    |> IO.inspect()
  end

  def main(["stream" | commands] = _args) do
    {file_name, regex} = parse_command(commands)

    file_name
    |> Methods.stream(regex)
  end

  def main(["flow" | commands] = _args) do
    {file_name, regex} = parse_command(commands)

    file_name
    |> Methods.flow(regex)
    |> IO.inspect()
  end

  defp parse_command([file_name | regs] = _commands) do
    [reg | _] = regs
    {_, regex} = Regex.compile(reg)
    {file_name, regex}
  end
end
