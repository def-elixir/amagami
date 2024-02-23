defmodule Amagami.Repo do
  use Ecto.Repo,
    otp_app: :amagami,
    adapter: Ecto.Adapters.SQLite3
end
