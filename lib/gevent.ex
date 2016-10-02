# [
#   {
#     "type": "Event",
#     "public": true,
#     "payload": {
#     },
#     "repo": {
#       "id": 3,
#       "name": "octocat/Hello-World",
#       "url": "https://api.github.com/repos/octocat/Hello-World"
#     },
#     "actor": {
#       "id": 1,
#       "login": "octocat",
#       "gravatar_id": "",
#       "avatar_url": "https://github.com/images/error/octocat_happy.gif",
#       "url": "https://api.github.com/users/octocat"
#     },
#     "org": {
#       "id": 1,
#       "login": "github",
#       "gravatar_id": "",
#       "url": "https://api.github.com/orgs/github",
#       "avatar_url": "https://github.com/images/error/octocat_happy.gif"
#     },
#     "created_at": "2011-09-06T17:26:27Z",
#     "id": "12345"
#   }
# ]
defmodule Gevent do
  def type(gevent) do
    Kernel.get_in(gevent, ["type"])
  end

  def public(gevent) do
    Kernel.get_in(gevent, ["public"])
  end

  def actor(gevent) do
    Kernel.get_in(gevent, ["actor", "login"])
  end

  def repo(gevent) do
    Kernel.get_in(gevent, ["repo", "name"])
  end

  def created_at(gevent) do
    Kernel.get_in(gevent, ["created_at"])
  end

  def payload(gevent) do
    Kernel.get_in(gevent, ["payload"])
  end
end

#defmodule Gevent.Payload do
  #use Gevent
#end
