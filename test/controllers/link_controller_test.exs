defmodule Shorty.LinkControllerTest do
  use Shorty.ConnCase

  alias Shorty.Link
  @valid_attrs %{url: "http://example.com"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, link_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing links"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, link_path(conn, :new)
    assert html_response(conn, 200) =~ "New link"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, link_path(conn, :create), link: @valid_attrs
    assert redirected_to(conn) == link_path(conn, :index)
    assert Repo.get_by(Link, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, link_path(conn, :create), link: @invalid_attrs
    assert html_response(conn, 200) =~ "New link"
  end

  test "shows chosen resource", %{conn: conn} do
    link = Repo.insert! %Link{key: "google", url: "http://example.com"}
    conn = get conn, shortlink_path(conn, :show, link.key)
    assert redirected_to(conn) == "http://example.com"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, shortlink_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    link = Repo.insert! %Link{}
    conn = get conn, link_path(conn, :edit, link)
    assert html_response(conn, 200) =~ "Edit link"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    link = Repo.insert! %Link{key: "lol"}
    conn = put conn, link_path(conn, :update, link), link: @valid_attrs
    assert redirected_to(conn) == link_path(conn, :show, link)
    assert Repo.get_by(Link, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    link = Repo.insert! %Link{}
    conn = put conn, link_path(conn, :update, link), link: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit link"
  end

  test "deletes chosen resource", %{conn: conn} do
    link = Repo.insert! %Link{}
    conn = delete conn, link_path(conn, :delete, link)
    assert redirected_to(conn) == link_path(conn, :index)
    refute Repo.get(Link, link.id)
  end
end
