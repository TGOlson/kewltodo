class Todo < ActiveRecord::Base
	attr_accessible :description, :complete

	validates_presence_of :description
end