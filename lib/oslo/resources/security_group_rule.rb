require 'oslo/resources/security_group'
module Oslo::Resources
  class SecurityGroupRule < Base
    friendly_attributes :ethertype

    def self.define_attribute_with_guard(_name, _guard_name)
      name = _name.to_s
      guard_name = _guard_name.to_s
      define_method name do
        self[name] || self[guard_name]
      end
    end

    define_attribute_with_guard :port_range_max, :from_port
    define_attribute_with_guard :port_range_min, :to_port
    define_attribute_with_guard :protocol, :ip_protocol
    define_attribute_with_guard :security_group_id, :parent_group_id

    def security_group
      SecurityGroup.find(security_group_id)
    end

    def port
      if port_range_max == port_range_min
        port_range_max
      else
        port_range
      end
    end

    def remote_ip_cidr
      if cidr = self["remote_ip_prefix"]
        cidr
      elsif ip_range = self["ip_range"]
        ip_range["cidr"]
      end
    end

    def port_range
      port_range_max..port_range_min
    end

    def remote_group
      return nil if self["remote_group_id"].nil? && (self["group"].nil? || self["group"].empty?)

      SecurityGroup.new(
        {"id" => self["remote_group_id"]}.merge(self["group"] || {})
      )
    end

    self.service        = "compute"
    self.resource_name  = "os-security-group-rule"
    self.resources_name = "os-security-group-rules"
  end
end
