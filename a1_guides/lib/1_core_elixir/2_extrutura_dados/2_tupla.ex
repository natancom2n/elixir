#https://elixir-lang.org/getting-started/basic-types.html#tuples

#Tuples #######################################################
# https://elixir-lang.org/getting-started/basic-types.html#tuples

iex> {:ok, "hello"}
{:ok, "hello"}
iex> tuple_size {:ok, "hello"}
2

iex> tuple = {:ok, "hello"}
{:ok, "hello"}
iex> elem(tuple, 1)
"hello"
iex> tuple_size(tuple)
2

#put in tuples, modification
iex> tuple = {:ok, "hello"}
{:ok, "hello"}
iex> put_elem(tuple, 1, "world")
{:ok, "world"}
iex> tuple
{:ok, "hello"}

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


#AO LER UM ARQUIVO O RETORNO SERÁ SEMPRE UMA TUPLE
iex> File.read("path/to/existing/file")
{:ok, "... contents ..."}
iex> File.read("path/to/unknown/file")
{:error, :enoent}
