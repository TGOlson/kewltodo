require 'spec_helper'

describe 'List Page' do

	let!(:list) { List.create name: 'cool list' }

	context 'can see all lists' do
		it 'should show name of lists' do
			visit lists_path
			expect(page).to have_content list.name
		end
	end

	context 'can create a new list' do
		it 'can navigate to create new form' do
			visit lists_path
			click_link 'create new list'
			expect(page).to have_field 'name'
		end

		it 'can create a new list with valid params' do
			expect{
				visit new_list_path
				fill_in 'name', with: 'cool'
				click_button 'submit'
				}.to change(List, :count).by 1
		end

		it 'will not create a new list with valid params' do
			expect{
				visit new_list_path
				click_button 'submit'
				}.to change(List, :count).by 0
		end
	end
end