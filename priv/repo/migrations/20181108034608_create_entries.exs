defmodule Howitgoesbot.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :customer, :text
      add :description, :text
      add :date, :date

      timestamps
    end
  end
end
