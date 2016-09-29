defmodule Metascope.PullRequestTest do
  use Metascope.ModelCase

  alias Metascope.PullRequest

  @valid_attrs %{created_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, owner: "some content", payload: "some content", title: "some content", updated_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PullRequest.changeset(%PullRequest{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PullRequest.changeset(%PullRequest{}, @invalid_attrs)
    refute changeset.valid?
  end
end
