class Todo < ActiveRecord::Base
	attr_accessible :description, :complete, :list_id
	validates_presence_of :description, :list_id
	belongs_to :list

	def toggle_complete
		self.complete = !self.complete
	end
end