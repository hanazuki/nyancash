module NyanCash::Core::Models
  model :Slot do
    one_to_one :next, class: models.Slot, primary_key: :guid_val, key: :obj_guid
    one_to_many :nexts, class: models.Slot, primary_key: :guid_val, key: :obj_guid
  end
end
