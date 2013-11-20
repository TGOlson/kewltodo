require 'spec_helper'

describe Todo do
	it { should allow_mass_assignment_of(:description) }
	it { should allow_mass_assignment_of(:complete) }

	it { should validate_presence_of :description }

	let(:todo) { Todo.new description: 'cool'}

	it "complete should default to false" do
		expect(todo.complete).to eq(false)
	end

end