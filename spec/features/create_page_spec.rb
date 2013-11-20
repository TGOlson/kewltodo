require 'spec_helper'

describe 'Create Todo Page' do

  it 'Can create a new todo' do
    expect{
      visit new_todo_path
      fill_in 'Description', with: 'Cool todo, dude'
      click 'Submit'
      }.to change{Todo.count}.by(1)
  end

end

