class List < ActiveRecord::Base
	attr_accessible :name, :complete
	validates_presence_of :name
	has_many :todos
end