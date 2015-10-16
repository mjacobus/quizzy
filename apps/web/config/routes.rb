# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
get '/admin/quizzes', to: 'quizzes#index', as: :quizzes
get '/admin/quizzes/show', to: 'quizzes#show'

get "/auth/:provider/callback",
  to: "session#create_google_session",
  as: :session_create_google_session

get "/auth/failure", to: "auth#failure"
get "/auth/signout", to: "auth#signout"
