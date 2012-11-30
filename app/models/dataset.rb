class Dataset < ActiveRecord::Base
  	attr_accessible :name, :rows, :num_rows, :row_length
  	serialize :rows
  	belongs_to :project
    attr_accessible :a1, :a2, :a3, :a4, :a5, :a6, :a7, :a8, :a9,
                 :b1, :b2, :b3, :b4, :b5, :b6, :b7, :b8, :b9,
                 :c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8, :c9

  	validates :project_id, presence: true
  	validates :name, presence: true, length: { maximum: 50 }
    validates :rows, length: { minimum: 1 }

  	def self.serialized_attr_accessor(*args)
  		args.each do |method_name|
  			eval "
  				def #{method_name}
  					(self.rows || {})[:#{method_name}]
  				end
  				def #{method_name}=(value)
  					self.rows ||= {}
  					self.rows[:#{method_name}] = value
  				end
  				"
  		end
  	end

  	serialized_attr_accessor :a1, :a2, :a3, :a4, :a5, :a6, :a7, :a8, :a9,
  							 :b1, :b2, :b3, :b4, :b5, :b6, :b7, :b8, :b9,
  							 :c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8, :c9

end




