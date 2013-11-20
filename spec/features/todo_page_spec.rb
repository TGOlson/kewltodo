require 'spec_helper'

describe 'Todo Page' do

  let!(:todo){ Todo.create description: 'Sweet Test Instance', complete: false }

  context 'Can see a list of all the todos' do
    it "is a test" do
      visit todos_path
      expect(page).to have_content todo.description
    end
  end

	context 'Can go to the create page by clicking "+"' do
    it "is a test" do
  		visit todos_path
  		click_link '+'
      expect(current_path).to eq(new_todo_path)
    end
  end

end

