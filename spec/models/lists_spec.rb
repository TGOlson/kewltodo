require 'spec_helper'

describe List do
	it { should allow_mass_assignment_of :name }
	it { should allow_mass_assignment_of :complete }
	
	it { should validate_presence_of :name }
	
	it { should have_many :todos}

	let!(:list) {List.create name:'cool'}

	it 'complete should default to false' do
		expect(list.complete).to eq false
	end
end