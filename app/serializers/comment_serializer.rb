class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :resource_id, :resource_type, :author, :author_type, :created_at

  has_many :comments, key: :replies
end
