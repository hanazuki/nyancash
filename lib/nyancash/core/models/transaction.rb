require_relative 'base'

module NyanCash::Core::Models
  model :Transaction do
    include Base

    schema_version 3

    one_to_many :splits, class: models.Split, key: :tx_guid
    many_to_one :currency, class: models.Commodity, key: :currency_guid
    one_to_many :slots, class: models.Slot, key: :obj_guid
  end
end
