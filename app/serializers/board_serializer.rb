class BoardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cards
end
