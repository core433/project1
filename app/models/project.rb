class Project < ActiveRecord::Base
	attr_accessible :title

	has_many :reverse_rel_projects, foreign_key: "project_id",
                                    class_name: "RelProject",
                                    dependent: :destroy

  has_many :users, through: :reverse_rel_projects, source: :user
  has_many :time_entries, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }

  def has_user?(user)
    reverse_rel_projects.find_by_user_id(user.id)
  end

  def add_user!(user)
    reverse_rel_projects.create!(user_id: user.id)
  end

  def remove_user!(user)
    reverse_rel_projects.find_by_user_id(user.id).destroy
  end

end
