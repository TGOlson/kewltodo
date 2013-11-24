require 'spec_helper'

describe 'Todo Page' do

	let!(:list){ List.create name: 'Test Instance' }
	let!(:todo) { Todo.create description: 'Cool test', list_id: list.id}

	context 'can see all todos for a specific list' do
		it 'todo is shown on page' do
			visit list_todos_path(list)
			page.should have_content todo.description
		end

		it 'todo can be marked as complete' do
			visit list_todos_path(list)
			click_link 'complete-' + todo.id.to_s
			expect(Todo.last.complete).to eq true
		end

		it 'can be deleted' do
			visit list_todos_path(list)
			expect{
			click_link 'delete-' + todo.id.to_s
			}.to change(Todo, :count).by -1
		end
	end

	context 'can create a new todo' do
		it 'Page has a button to create a new todo' do	
			visit list_todos_path(list)
			page.should have_link '+'
		end
	
		it 'create a new todo with valid params' do
			expect{
			visit list_todos_path(list)
			click_link '+'
			fill_in 'todo_description', with: 'testy'
			click_button 'save'
			}.to change(Todo, :count).by 1
		end	

		it 'will not create a new todo with invalid params' do
			expect{
			visit list_todos_path(list)
			click_link '+'
			click_button 'save'
			# add expect test for error message
			}.to change(Todo, :count).by 0
		end
	end
end
