defmodule DisabledChangeEvent.Repo do
  use Ecto.Repo,
    otp_app: :disabled_change_event,
    adapter: Ecto.Adapters.Postgres
end
