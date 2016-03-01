require "application/dependencies"

class TestDb
  def self.instance
    @instance ||= new
  end

  def dependencies
    @dependencies ||= Application::Dependencies.instance
  end

  def repository(repository)
    dependencies.fetch(repository)
  end

  def adapter
    dependencies.fetch(:db_connection)
  end

  def self.inside_transaction(&block)
    instance.adapter.transaction(rollback: :always) do
      block.call
    end
  end
end

module DbSpecHelper
  def inside_transaction(&block)
    TestDb.inside_transaction(&block)
  end
end
