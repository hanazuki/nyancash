module NyanCash::Core::Models
  model :Account do
    many_to_one :parent, class: models.Account, key: :parent_guid
    one_to_many :splits, class: models.Split, key: :account_guid
    many_to_one :commodity, class: models.Commodity, key: :commodity_guid
    one_to_many :slots, class: models.Slot, key: :obj_guid
  end
end
