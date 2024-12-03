{:ok, contents} = File.read("puzzle2input.txt")
filterContents = contents |> String.split(["\n"], trim: true)
levels = Enum.map(filterContents, fn x -> String.split(x, " ", trim: true) |>
Enum.map(fn element -> String.to_integer(element) end) |>
Enum.chunk_every(2,1, :discard) |> Enum.map(fn [a, b] -> b-a end)
end)
safeLevels = Enum.map(levels, fn x -> Enum.map(x, fn
  y when y > 3 -> :exceed
  y when y == 0 -> :nochange
  y when y < -3 -> :exceed
  y when y > 0 and y <= 3 -> :inc
  y when y < 0 and y >= -3 -> :dec
  _ -> :other
end) end)
output = Enum.filter(safeLevels, fn x -> Enum.uniq(x) |> length() == 1 end) |> length()
IO.puts(inspect(output))
