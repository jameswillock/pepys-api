class DiaryEntrySerializer < ActiveModel::Serializer
  attributes :published_on, :text
end
