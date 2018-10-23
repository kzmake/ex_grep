defmodule Egrep.Methods do
  @moduledoc false

  def enum(file_name, query) do
    file_name
    |> File.stream!()
    |> Enum.filter(fn l -> String.contains?(l, query) end)
    |> Enum.each(&IO.write/1)
  end

  def stream(file_name, query) do
    file_name
    |> File.stream!()
    |> Stream.filter(fn l -> String.contains?(l, query) end)
    |> Enum.each(&IO.write/1)
  end

  def flow(file_name, query) do
    file_name
    |> File.stream!()
    |> Flow.from_enumerable()
    |> Flow.filter(fn l -> String.contains?(l, query) end)
    |> Enum.each(&IO.write/1)
  end
end
