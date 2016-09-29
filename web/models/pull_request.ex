defmodule Metascope.PullRequest do
  use Metascope.Web, :model

  schema "pull_requests" do
    field :title, :string
    field :owner, :string
    field :payload, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :owner, :created_at, :updated_at, :payload])
    |> validate_required([:title, :owner, :created_at, :updated_at, :payload])
  end
end
