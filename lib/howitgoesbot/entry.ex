defmodule Howitgoesbot.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "entries" do
    field :customer, :string
    field :description, :string
    field :date, :utc_datetime

    timestamps
  end

  @fields ~w(customer description date)

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required([:customer, :description])
  end
end