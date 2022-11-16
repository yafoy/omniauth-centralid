require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Centralid < OmniAuth::Strategies::OAuth2
      option :name, :centralid

      option :client_options, {
        site: "https://centralid.yafoy.com",
        authorize_path: "/oauth/authorize"
      }

      option :fields, [:name, :email]

      uid do
        raw_info["id"]
      end

      info do
        {
          name: raw_info["full_name"],
          email: raw_info["email"],
          username: raw_info["username"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/me").parsed
      end

      # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
