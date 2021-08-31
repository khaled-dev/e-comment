# == Schema Information
#
# Table name: comment
#
#  id            :bigint           not null, primary key
#  author_type   :string
#  body          :text
#  resource_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  author_id     :bigint
#  resource_id   :bigint
#
# Indexes
#
#  index_comments_on_author_type_and_author_id      (author_type,author_id)
#  index_comments_on_resource_type_and_resource_id  (resource_type,resource_id)
#

class Comment < ApplicationRecord
  belongs_to :resource, polymorphic: true
  belongs_to :author, polymorphic: true
  has_many :comments, as: :resource

  validates :body, presence: true
end
