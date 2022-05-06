defmodule AppB.Repo do
  use Ecto.Repo,
    otp_app: :app_b,
    adapter: Ecto.Adapters.Postgres
end
