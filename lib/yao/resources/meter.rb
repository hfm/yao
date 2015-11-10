require 'time'
module Yao::Resources
  class Meter < Base
    friendly_attributes :meter_id, :name, :user_id, :resource_id, :project_id, :source, :type, :unit

    def id
      meter_id
    end

    def resource
      @resource ||= Yap::Resource.get(resource_id)
    end

    def tenant
      @tenant ||= Yap::User.get(project_id)
    end

    def user
      @user ||= Yap::User.get(user_id)
    end

    self.service        = "metering"
    self.api_version    = "v2"
    self.resources_name = "meters"

    class << self
      private
      def resource_from_json(json)
        json
      end

      def resources_from_json(json)
        json
      end
    end
  end
end
