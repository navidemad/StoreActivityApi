class VisitSerializer < ActiveModel::Serializer
  attributes :id, :report

  belongs_to :store
end
