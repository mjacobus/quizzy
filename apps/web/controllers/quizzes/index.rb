module Web::Controllers::Quizzes
  class Index
    include Web::Action
    expose :quizzes

    def call(params)
      @quizzes = service.all

      # TODO: Use seeds instead
      create_quizzes if @quizzes.size == 0
    end

    private

    def service
      dependencies.fetch(Quizzy::Quiz::QuizService)
    end

    # TODO: move to base action
    # TODO: figure out how to inject dependency rather than using singleton
    def dependencies
      Application::Dependencies.instance
    end

    def create_quizzes
      (1..10).each do |number|
        quiz = ::Quizzy::Quiz::Quiz.new
        quiz.title = "title #{number}"
        quiz.description = "description #{number}"
        quiz.private = true
        quiz.created_at = Time.now
        quiz.created_at = Time.now

        service.create(quiz)
      end
    end
  end
end
