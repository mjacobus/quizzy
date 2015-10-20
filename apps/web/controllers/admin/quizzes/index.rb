require "application/concerns/application_dependencies_aware"

module Web::Controllers::Admin::Quizzes
  class Index
    include Web::Action
    include Application::Concerns::ApplicationDependenciesAware

    expose :quizzes

    def call(params)
      @quizzes = quiz_service.all
    end

    private

    def quiz_service
      dependencies.fetch(Quizzy::Quiz::QuizService)
    end
  end
end
