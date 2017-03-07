class BoardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :lists
end
