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
	
		it 'create a new todo' do
			expect{
			visit new_list_todo_path(list)
			fill_in 'description', with: 'testy'
			click_button 'submit'
			}.to change(Todo, :count).by 1
		end

		it 'can set complete to true' do
			visit new_list_todo_path(list)
			fill_in 'description', with: 'testy'
			check 'complete'
			click_button 'submit'
			expect(Todo.last.complete).to eq true
		end
	end
end
