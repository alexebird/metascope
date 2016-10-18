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

## Development
```
# server + console
iex -S mix phoenix.server
# server-only
mix phoenix.server
```
