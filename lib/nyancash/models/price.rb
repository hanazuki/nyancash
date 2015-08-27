require_relative 'base'

module NyanCash::Models
  model :Price do
    include Base

    schema_version 2

    many_to_one :commodity, class: models.Commodity, key: :commodity_guid
    many_to_one :currency, class: models.Commodity, key: :currency_guid
  end
end
