class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  validates :user_id, :uniqueness => { :scope => :topic_id }
  validates :specific, :actionable, :kind, :inclusion => { in: (-2..2) }

  attr_accessible :user_id, :topic_id, :specific, :actionable, :kind
end
