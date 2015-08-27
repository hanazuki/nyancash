require_relative 'base'

module NyanCash::Models
  model :Account do
    include Base

    schema_version 1

    many_to_one :parent, class: models.Account, key: :parent_guid
    one_to_many :children, class: models.Account, key: :parent_guid
    one_to_many :splits, class: models.Split, key: :account_guid
    many_to_one :commodity, class: models.Commodity, key: :commodity_guid
    one_to_many :lots, class: models.Lot, key: :account_guid
    one_to_many :slots, class: models.Slot, key: :obj_guid
  end
end
