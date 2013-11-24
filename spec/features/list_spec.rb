require 'spec_helper'

describe 'List Page' do

	let!(:list) { List.create name: 'cool list' }

	context 'can see all lists' do
		it 'should show name of lists' do
			visit lists_path
			expect(page).to have_content list.name
		end
	end

end