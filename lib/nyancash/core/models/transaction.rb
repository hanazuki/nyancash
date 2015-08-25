module NyanCash::Core::Models
  model :Transaction do
    one_to_many :splits, class: models.Split, key: :tx_guid
    many_to_one :currency, class: models.Commodity, key: :currency_guid
    one_to_many :slots, class: models.Slot, key: :obj_guid
  end
end
