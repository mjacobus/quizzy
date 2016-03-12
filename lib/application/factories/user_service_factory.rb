module Application
  module Factories
    class UserServiceFactory
      def create_service(dependencies)
        repository = dependencies.get(Quizzy::Infrastructure::UserRepository)
        Quizzy::Service::UserService.new(repository)
      end
    end
  end
end
