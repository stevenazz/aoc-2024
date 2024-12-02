{:ok, contents} = File.read("puzzle1input.txt")
filterContents = contents |> String.split(["   ", "\n"], trim: true)
listIndex = Enum.with_index(filterContents, fn x , y -> {y, String.to_integer(x)} end)
leftValues = Enum.sort(Enum.map(Enum.filter(listIndex, fn x -> rem(elem(x, 0), 2) == 0 end), fn x -> elem(x, 1) end))
rightValues = Enum.sort(Enum.map(Enum.filter(listIndex, fn x -> rem(elem(x, 0), 2) > 0 end), fn x -> elem(x, 1) end))
combinedValues = Enum.zip(leftValues, rightValues)
result = Enum.map(combinedValues, fn a -> abs(elem(a, 1) - elem(a, 0)) end)

IO.puts(Enum.reduce(result, 0, fn x, acc -> x + acc end))