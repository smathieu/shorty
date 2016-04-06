defmodule Shorty.Link do
  use Shorty.Web, :model
  use Ecto.Schema

  schema "links" do
    field :url, :string
    field :key, :string

    timestamps
  end

  @required_fields ~w(url key)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def last do
    Shorty.Repo.one(from x in Shorty.Link, order_by: [desc: x.id], limit: 1)
  end
end
