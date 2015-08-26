require_relative 'base'

module NyanCash::Core::Models
  model :Split do
    include Base

    schema_version 4

    many_to_one :account, class: models.Account, key: :account_guid
    many_to_one :transaction, class: models.Transaction, key: :tx_guid
    one_to_many :slots, class: models.Slot, key: :obj_guid
  end
end
