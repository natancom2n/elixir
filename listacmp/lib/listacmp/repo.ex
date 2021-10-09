defmodule Listacmp.Repo do
  use Ecto.Repo,
    otp_app: :listacmp,
    adapter: Ecto.Adapters.Postgres
end
