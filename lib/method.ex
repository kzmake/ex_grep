defmodule Egrep.Methods do
  @moduledoc false

  def enum(file_name, regex) do
    file_name
    |> File.stream!()
    |> Enum.filter(fn l -> Regex.match?(regex, l) end)
    |> Enum.each(&IO.write/1)
  end

  def stream(file_name, regex) do
    file_name
    |> File.stream!(read_ahead: 100_000)
    |> Stream.filter(fn l -> Regex.match?(regex, l) end)
    |> Enum.each(&IO.write/1)
  end

  def flow(file_name, regex) do
    file_name
    |> File.stream!()
    |> Flow.from_enumerable()
    |> Flow.filter(fn l -> Regex.match?(regex, l) end)
    |> Enum.each(&IO.write/1)
  end
end
