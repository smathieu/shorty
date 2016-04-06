defmodule Shorty.Repo.Migrations.CreateLink do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string
      add :key, :string

      timestamps
    end

  end
end
