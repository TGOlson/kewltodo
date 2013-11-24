require 'spec_helper'

describe 'Todo Page' do

  let!(:todo) { Todo.create description: 'Cool test'}

  context 'can see all todos' do
    it 'is shown on page' do
      visit '/todos'
      page.should have_content todo.description
    end

    it 'can be marked as complete' do
      visit '/todos'
      click_link 'complete'
      expect(Todo.last.complete).to eq true
    end

    it 'can be deleted' do
      visit '/todos'
      expect{
        click_link 'delete'
        }.to change(Todo, :count).by -1
      end
    end

    context 'can create a new todo' do
      it 'Page has a button to create a new todo' do        
        visit '/todos'
        page.should have_link 'create a new todo'
      end
      
      it 'create a new todo' do
        expect{
          visit '/todos'
          click_link 'create a new todo'
          fill_in 'description', with: 'testy'
          click_button 'submit'
          }.to change(Todo, :count).by 1
        end

        it 'can set complete to true' do
          visit '/todos/new'
          fill_in 'description', with: 'testy'
          check 'complete'
          click_button 'submit'
          expect(Todo.last.complete).to eq true
        end
      end
    end