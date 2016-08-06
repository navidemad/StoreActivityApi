class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :visits
end
