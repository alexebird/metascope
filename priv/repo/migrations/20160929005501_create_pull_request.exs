defmodule Metascope.Repo.Migrations.CreatePullRequest do
  use Ecto.Migration

  def change do
    create table(:pull_requests) do
      add :title, :string
      add :owner, :string
      add :created_at, :datetime
      add :updated_at, :datetime
      add :payload, :text

      timestamps()
    end

  end
end
