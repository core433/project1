# Relationship Model for User <-> Project pairings
class RelProject < ActiveRecord::Base
  attr_accessible :project_id, :user_id

  belongs_to :user, class_name: "User"
  belongs_to :project, class_name: "Project"

  validates :user_id, presence: true
  validates :project_id, presence: true

end
