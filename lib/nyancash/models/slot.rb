require_relative 'base'

module NyanCash::Models
  model :Slot do
    include Base

    schema_version 3

    one_to_one :next, class: models.Slot, primary_key: :guid_val, key: :obj_guid
    one_to_many :nexts, class: models.Slot, primary_key: :guid_val, key: :obj_guid
  end
end
