class Todo < ActiveRecord::Base
	attr_accessible :description, :complete
	validates_presence_of :description
	belongs_to :list
end