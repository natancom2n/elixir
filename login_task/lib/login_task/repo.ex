defmodule LoginTask.Repo do
  use Ecto.Repo,
    otp_app: :login_task,
    adapter: Ecto.Adapters.Postgres
end
