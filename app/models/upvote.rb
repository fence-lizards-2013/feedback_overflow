class Upvote < ActiveRecord::Base
  attr_accessible :topic_id, :user_id
  belongs_to :topic
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :topic_id
end
