class User < ActiveRecord::Base
  	attr_accessible :email, :name, :password, :password_confirmation
  	has_secure_password

  	before_save { |user| user.email = email.downcase }
  	before_save :create_remember_token

    has_many :rel_projects, foreign_key: "user_id", dependent: :destroy
    has_many :projects, through: :rel_projects, source: :project

  	validates :name, presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  									uniqueness: { case_sensitive: false }
  	validates :password, presence: true, length: { minimum: 6 }
  	validates :password_confirmation, presence: true

    def has_project?(project)
      rel_projects.find_by_project_id(project.id)
    end

    def add_project!(project)
      rel_projects.create!(project_id: project.id)
    end

    def remove_project!(project)
      rel_projects.find_by_project_id(project.id).destroy
    end

  	private

  		def create_remember_token
  			self.remember_token = SecureRandom.urlsafe_base64
  		end

end
