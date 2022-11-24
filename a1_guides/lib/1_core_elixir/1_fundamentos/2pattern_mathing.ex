#https://elixir-lang.org/getting-started/pattern-matching.html

iex> {:ok, result} = {:ok, 13}
{:ok, 13}
iex> result
13

iex> {:ok, result} = {:error, :oops}
** (MatchError) no match of right hand side value: {:error, :oops}


##in lists
iex> [a, b, c] = [1, 2, 3]
[1, 2, 3]
iex> a
1

#addd items list
iex> list = [1, 2, 3]
[1, 2, 3]
iex> [0 | list]
[0, 1, 2, 3]
