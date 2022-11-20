defmodule LogLevel do
  def to_label(level, legacy?) do
    case legacy? do
      false ->
        case level do
          0 -> :trace
          1 -> :debug
          2 -> :info
          3 -> :warning
          4 -> :error
          5 -> :fatal
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

    label = to_label(level, legacy?)

    IO.puts("label = #{label}")
    IO.puts("level = #{level}")

    case label do
      :error -> :ops
      :fatal -> :ops
      :unknown ->
        # if level > 6 and legacy? == false do
        #   :dev1
        # else if level > 6 and level != 0 do
        #   :dev2
        # else
        #   :dev1
        # end
        cond do
          level == 6 and legacy? == false ->
            :dev2
          level >= 6 and level != 0 ->
            :dev2
          level <= 5 ->
            :dev1
        end
        _ -> :false
    end
  end


end
