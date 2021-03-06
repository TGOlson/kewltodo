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
			click_link '+'
			expect(page).to have_field 'list_name'
		end

		it 'can create a new list with valid params' do
			expect{
				visit new_list_path
				fill_in 'list_name', with: 'cool'
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

	context 'can update attributes' do
		it 'can be marked as complete' do
			visit lists_path
			click_link 'complete-' + list.id.to_s
			expect(List.last.complete).to eq true
		end

		it 'can be deleted' do
			expect{
			visit lists_path
			click_link 'delete-' + list.id.to_s
			}.to change(List, :count).by -1
		end
	end

	context 'can see all related todos' do
		it 'can navigate to list show page' do
			list.todos << Todo.create(description: 'kewl todo')
			visit list_todos_path(list.id)
			expect(page).to have_content 'kewl todo'
		end	
	end
end