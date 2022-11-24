#https://elixir-lang.org/getting-started/basic-types.html#linked-lists

#(Linked) Lists #######################################################
iex> [1, 2, true, 3]
[1, 2, true, 3]

#legth
iex> length [1, 2, 3]
3

#concatenation lists
iex> [1, 2, 3] ++ [4, 5, 6]
[1, 2, 3, 4, 5, 6]
iex> [1, true, 2, false, 3, true] -- [true, false]
[1, 2, 3, true]

# head and tail lists
iex> list = [1, 2, 3]
iex> hd(list)
1
iex> tl(list)
[2, 3]

#addd items list w/ pattering matching
iex> list = [1, 2, 3]
[1, 2, 3]
iex> [0 | list]
[0, 1, 2, 3]


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


#####################  difference between lists and tuples #################

#pode ser adicionado itens somente no final e no começo
iex> list = [1, 2, 3]
[1, 2, 3]

# This is fast as we only need to traverse `[0]` to prepend to `list`
iex> [0] ++ list
[0, 1, 2, 3]

# This is slow as we need to traverse `list` to append 4
iex> list ++ [4]
[1, 2, 3, 4]

#tuples podem ser adicinoados em qualquer local, apenas colocando chave e valor
iex> tuple = {:a, :b, :c, :d}
{:a, :b, :c, :d}
iex> put_elem(tuple, 2, :DOIS)
{:a, :b, :DOIS, :d}
