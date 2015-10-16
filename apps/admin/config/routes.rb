# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
get '/quizzes', to: 'quizzes#index', as: :quizzes
get '/quizzes/show', to: 'quizzes#show'
