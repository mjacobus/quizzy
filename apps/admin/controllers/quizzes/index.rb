module Admin::Controllers::Quizzes
  class Index
    include Admin::Action
    expose :quizzes

    def call(params)
      @quizzes = repository.all

      create_quizzes(repository) if @quizzes.size == 0
    end

    private

    def repository
      dependencies.fetch(Quizzy::Repositories::QuizRepository)
    end

    # TODO: move to base action
    # TODO: figure out how to inject dependency rather than using singleton
    def dependencies
      Application::Dependencies.instance
    end

    def create_quizzes(repository)
      (1..10).each do |number|
        quiz = ::Quizzy::Entities::Quiz.new
        quiz.title = "title #{number}"
        quiz.description = "description #{number}"
        quiz.private = true
        quiz.created_at = Time.now
        quiz.created_at = Time.now

        repository.create(quiz)
      end
    end
  end
end
