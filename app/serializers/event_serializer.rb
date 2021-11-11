class EventSerializer < ActiveModel::Serializer
  attribute :id
  attribute :description
  attribute :effective_date
  attribute :status
  attribute :image_url

  has_one :category
end
