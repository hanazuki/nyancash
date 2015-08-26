require_relative 'base'

module NyanCash::Core::Models
  model :Book do
    include Base

    schema_version 1

    one_to_many :slots, class: models.Slot, key: :obj_guid
  end
end
