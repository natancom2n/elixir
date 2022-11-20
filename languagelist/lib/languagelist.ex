defmodule LanguageList do

  def new() do
    []
  end

  def add(list, lang)do
    list = [lang| list]
  end

  def remove(list) do
    List.delete_at(list, 0)
  end

  def first(list) do
    [head | tail] = list
    head
  end
  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
