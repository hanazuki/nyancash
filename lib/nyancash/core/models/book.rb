module NyanCash::Core::Models
  model :Book do
    one_to_many :slots, class: models.Slot, key: :obj_guid
  end
end