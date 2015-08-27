require_relative 'base'

module NyanCash::Models
  model :Lot do
    include Base

    schema_version 2

    many_to_one :account, class: models.Account, key: :account_guid
    one_to_many :splits, class: models.Split, key: :lot_guid
  end
end
