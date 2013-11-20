require 'spec_helper'

describe 'Todo Features' do

  let!(:todo){ Todo.create description: 'Sweet Test Instance', complete: false }

  context 'Todo index page' do
    it "can see a list of all todos" do
      visit todos_path
      expect(page).to have_content todo.description
    end

    it "can click a link to visit the 'new' page" do
      visit todos_path
      click_link '+'
      expect(current_path).to eq(new_todo_path)
    end
  end

  context 'Create Todo Page' do
    it 'Can create a new todo' do
      expect{
        visit new_todo_path
        fill_in 'Description', with: 'Cool todo, dude'
        click_button 'Submit'
        }.to change{Todo.count}.by(1)
    end
  end

end


