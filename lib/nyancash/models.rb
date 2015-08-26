module NyanCash::Models
  All = []

  module_function
  def model(name, &block)
    All << NyanCash::ModelDefinition.new(name, &block)
  end
end
