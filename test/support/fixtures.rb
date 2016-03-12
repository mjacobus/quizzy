class Fixtures
  include Application::Concerns::ApplicationDependenciesAware

  def create_user(params = {})
    params = {
      email: "user#{number}@gmail.com",
      provider: "google_oauth2",
      name: "Foo da Silva",
      uid: "google_oauth2",
      created_at: Time.now.utc,
      updated_at: Time.now.utc,
    }.merge(params)

    create(params, "Quizzy::Infrastructure::UserRepository")
  end

  def create_quiz(params = {})
    number = self.number
    params = {
      user_id: number,
      title: "title #{number}",
      description: "title #{number}",
      private: number.even?,
      created_at: Time.now.utc,
      updated_at: Time.now.utc,
    }.merge(params)

    create(params, "Quizzy::Infrastructure::QuizRepository")
  end

  def create(params, repository_key)
    repository = dependencies.get(repository_key)
    hydrator = repository.hydrator
    entity = repository.entity_prototype
    hydrator.hydrate(params, entity)
    repository.create(entity)
    entity
  end

  def number
    @@number ||= 0
    @@number += 1
  end
end
