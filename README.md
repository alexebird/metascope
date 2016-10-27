# Metascope

## Dev Setup

```
mix deps.get
mix local.hex
mix ecto.migrate
npm install
CREATE ROLE metascope WITH LOGIN;
CREATE DATABASE metascope_dev WITH OWNER metascope;
```

### Github Access

export `GITHUB_TOKEN` to a user's personal access token with Repo ("Full control of private repositories") checked.

## Development
```
# server + console
iex -S mix phoenix.server
# server-only
mix phoenix.server
```

## Github Visualization

Each level represents a level in the hierarchy of circles. All non-leaf sizes
are the sum of their children.

- Org (100%-sized circle)
  - Repos
    - Pull requests
      - Comments
        - comment 0..n (size = constant, https://developer.github.com/v3/issues/comments/#list-comments-on-an-issue)
      - diff (size: data from https://developer.github.com/v3/pulls/#get-a-single-pull-request)
    - Branches (size: diff size (https://developer.github.com/v3/repos/commits/#compare-two-commits) as compared with master)
