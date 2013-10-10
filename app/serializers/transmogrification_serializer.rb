class TransmogrificationSerializer < ActiveModel::Serializer
  attributes :id, :name, :source, :source_type, :compiled
end
