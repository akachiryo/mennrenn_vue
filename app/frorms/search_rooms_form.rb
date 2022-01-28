class SearchRoomsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string
  attribute :tag_ids, array: :integer

  def search
    relation = Room.distinct
    relation = relation.by_name(title) if title.present?
    relation = relation.by_tag(tag_ids) if tag_ids.present?
    relation
  end
end