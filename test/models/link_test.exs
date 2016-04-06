defmodule Shorty.LinkTest do
  use Shorty.ModelCase

  alias Shorty.Link

  @valid_attrs %{key: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Link.changeset(%Link{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Link.changeset(%Link{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "last" do
    assert Link.last == nil

    changeset = Link.changeset(%Link{}, @valid_attrs)
    {:ok, link} = Repo.insert(changeset)

    assert link.id == Link.last.id
  end
end
