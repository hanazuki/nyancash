module Sequel
  module Plugins
    module SchemaVersion
      class SchemaVersionMismatchError < StandardError
      end

      module ClassMethods
        def schema_version(expected_version)
          actual_version = db[:versions].select(:table_version).filter(table_name: table_name.to_s).single_value
          if actual_version != expected_version
            raise SchemaVersionMismatchError, "Schema version of table `#{table_name}` is expected be #{expected_version} but is #{actual_version}"
          end
        end
      end
    end
  end
end
