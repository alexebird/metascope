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
