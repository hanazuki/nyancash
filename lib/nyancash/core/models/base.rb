require 'sequel/plugins/schema_version'

module NyanCash::Core::Models
  module Base
    def self.included(klass)
      klass.instance_eval do
        plugin :schema_version
      end
    end
  end
end
