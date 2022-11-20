defmodule GuessingGame do

    def compare(secret, guess \\ :no_guess)
    def compare(_, :no_guess), do: "Make a guess"
    def compare(guess, guess), do: "Correct"
    def compare(secret, guess) when (guess - secret) in [1, -1], do: "So close"
    def compare(secret, guess) when not is_number(secret) or not is_number(guess), do: "Make a guess w/ numbers"
    def compare(secret, guess) when guess > secret, do: "Too high"
    def compare(secret, guess) when guess < secret, do: "Too low"


  end
