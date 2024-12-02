{:ok, contents} = File.read("puzzle1input.txt")
filterContents = contents |> String.split(["   ", "\n"], trim: true)
listIndex = Enum.with_index(filterContents, fn x , y -> {y, String.to_integer(x)} end)
leftValues = Enum.map(Enum.filter(listIndex, fn x -> rem(elem(x, 0), 2) == 0 end), fn x -> elem(x, 1) end)
rightValues = Enum.map(Enum.filter(listIndex, fn x -> rem(elem(x, 0), 2) > 0 end), fn x -> elem(x, 1) end)
combinedValues = Enum.map(leftValues, fn x -> x * Enum.count(rightValues, fn y -> y == x end) end)

IO.puts(Enum.reduce(combinedValues, 0, fn x, acc -> x + acc end))