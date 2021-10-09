defmodule Logs do
  def to_label(level, legacy?) do
    case legacy? do
      false ->
        case level do
          0 -> :trace
          5 -> :fatal
          1 -> :debug
          2 -> :info
          3 -> :warning
          4 -> :error
          _ -> :unknown
        end

      true ->
        case level do
          1 -> :debug
          2 -> :info
          3 -> :warning
          4 -> :error
          _ -> :unknown
        end
    end
  end

  def alert_recipient(level, legacy?) do
    #valueLevel = level
    label = to_label(level, legacy?)

    case label do
      :error -> :ops
      :fatal -> :ops
      :unknown ->
        if level > 6 or level < 0 do
          :dev2
        else
          :dev1
        end
      _ ->false
      end
  end
end
