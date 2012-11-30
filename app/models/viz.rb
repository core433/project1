class Viz < ActiveRecord::Base
  attr_accessible :description, :time
  belongs_to :project

  validates :project_id, presence: true
  validates :time, presence: true
  validates :description, presence: true, length: { maximum: 140 }

  default_scope order: 'vizs.created_at DESC'


end
