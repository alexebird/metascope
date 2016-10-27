defmodule Metascope.Github do
  @client Tentacat.Client.new(%{access_token: Application.fetch_env!(:metascope, :github_token)})
  @org "birdart"

  def repos do
    Tentacat.Repositories.list_orgs(@org, @client)
      |> Enum.map(&Map.get(&1, "name"))
  end

  def prs(repo) do
    Tentacat.Pulls.list(@org, repo, @client)
      |> Enum.map(fn(pr) -> Map.get(pr, "title") end)
  end

  def branches(repo) do
    Tentacat.Repositories.Branches.list(@org, repo, @client)
      |> Enum.map(&Map.get(&1, "name"))
  end

  def d3_node(name, children) do
    %{ "name" => name, "children" => children }
  end

  def d3_leaf(name, size) do
    %{ "name" => name, "size" => size }
  end

  def hierarchyD3 do
    d3_node(
      "repos",
      Metascope.Github.repos |> Enum.map(fn(repo) ->
          d3_node(repo, [
                    d3_node("prs",
                            Metascope.Github.prs(repo) |> Enum.map(&d3_leaf(&1, 3000))),
                    d3_node("branches",
                            Metascope.Github.branches(repo) |> Enum.map(&d3_leaf(&1, 3000)))
                  ])
      end)
     )
  end

  def hierarchy do
    #repos = Metascope.Github.repos
    #prs = repos |> Enum.map(&Metascope.Github.prs(&1))
    #branches = repos |> Enum.map(&Metascope.Github.branches(&1))

    %{ "repos" =>
      Metascope.Github.repos |> Enum.map(fn(repo) ->
        {
          repo, %{
            "prs" => Metascope.Github.prs(repo),
            "branches" => Metascope.Github.branches(repo)
          }
        }
      end)
      |> Enum.into(%{})
    }
  end
end
