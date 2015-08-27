require_relative 'base'

module NyanCash::Models
  model :Book do
    include Base

    schema_version 1

    many_to_one :root_account, class: models.Account, key: :root_account_guid
    many_to_one :root_template, class: models.Account, key: :root_template_guid
    one_to_many :slots, class: models.Slot, key: :obj_guid
  end
end
