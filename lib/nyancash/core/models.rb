module NyanCash::Core::Models
  All = []

  module_function
  def model(name, &block)
    All << NyanCash::Core::ModelDefinition.new(name, &block)
  end
end
