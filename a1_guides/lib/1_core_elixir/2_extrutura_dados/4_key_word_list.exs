
### keyword-lists ###########################
# https://elixir-lang.org/getting-started/keywords-and-maps.html#keyword-lists

iex> String.split("1 2 3", " ")
["1", "2", "3"]

#se adicionar espaço entre 1, 2 e o 3
iex> String.split("1  2  3", " ")
["1", "", "2", "", "3"]

#após o result acima para tirar os espaços vazio utlizar o trim
iex> String.split("1  2  3", " ", [trim: true])
["1", "2", "3"]

##
iex> list = [a: 1, b: 2]
[a: 1, b: 2]
iex> list ++ [c: 3]
[a: 1, b: 2, c: 3]
iex> [a: 0] ++ list
[a: 0, a: 1, b: 2]

##get data in the key:
iex> list[:a]
1
iex> list[:b]
2

iex> new_list = [a: 0] ++ list
[a: 0, a: 1, b: 2]
iex> new_list[:a]
0

iex(4)> list = [cabelo: "amarrom", pele: "branca", armadura: "spada"]
[cabelo: "amarrom", pele: "branca", armadura: "spada"]

iex(5)> list[:cabelo]
"amarrom"


iex> [a: a] = [a: 1]
[a: 1]
iex> a
1
iex> [a: a] = [a: 1, b: 2]
** (MatchError) no match of right hand side value: [a: 1, b: 2]
iex> [b: b, a: a] = [a: 1, b: 2]
** (MatchError) no match of right hand side value: [a: 1, b: 2]
