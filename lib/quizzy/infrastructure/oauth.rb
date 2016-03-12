module Quizzy
  module Infrastructure
    class Oauth
      def initialize(env)
        @env = env
      end

      def uid
        data[:uid]
      end

      def provider
        data[:provider]
      end

      def provider_data
        data.to_json
      end

      def name
        info[:name]
      end

      def email
        info[:email]
      end

      def origin
        @env['omniauth.origin']
      end

      private

      def data
        @env["omniauth.auth"]
      end

      def info
        data[:info]
      end
    end
  end
end
