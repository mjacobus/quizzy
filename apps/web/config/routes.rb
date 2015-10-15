# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
get "/auth/:provider/callback",
  to: "session#create_google_session",
  as: :session_create_google_session
