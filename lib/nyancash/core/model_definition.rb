require 'sequel'

module NyanCash::Core
  class ModelDefinition
    include Sequel::Inflections

    def initialize(name, table_name = underscore(pluralize(name)), &block)
      @name = name
      @table_name = table_name
      @block = block
    end

    def create(obj, db = obj.db)
      name = @name
      model = Class.new(Sequel::Model(db[@table_name.intern]))
      model.define_singleton_method(:name) { name }
      model.define_singleton_method(:models) { obj }
      obj.define_singleton_method(name) { model }
    end

    def config(obj)
      obj.send(@name).class_eval(&@block)
    end
  end
end
