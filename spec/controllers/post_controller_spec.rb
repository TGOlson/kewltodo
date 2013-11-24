require 'spec_helper'

describe TodosController do

        let!(:todo){ Todo.create description: 'Sweet Test Instance', complete: false }
        let(:todo_params){ {description: 'Cool test todo', complete: false} }

        describe 'todos' do
                it '#index' do
                        get :index
                   expect(assigns(:todos)).to eq Todo.all
                end

                it '#new' do
                        get :new
                   expect(assigns(:todo)).to be_an_instance_of Todo
                end                

                it '#create' do
                        expect{ post :create, todo: todo_params }.to change{Todo.count}.by(1)
                   expect(assigns(:todo).id).to_not be_nil
                end

                it '#edit' do
                        get :edit, id: todo.id
                   expect(assigns(:todo).id).to eq todo.id
                end

                it '#update' do
                        put :update, { id: todo.id, todo: todo_params }
                   expect(assigns(:todo).description).to eq 'Cool test todo'
                end

                it '#destroy' do
                        expect{ delete :destroy, id: todo.id }.to change{Todo.count}.by(-1)
                end
        end        
end