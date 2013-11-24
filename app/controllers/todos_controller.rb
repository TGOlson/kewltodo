class TodosController < ApplicationController

	def index
		@todos = Todo.where('list_id = ?', params[:list_id])
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new params[:todo]
		@todo.list_id = params[:list_id]
		if @todo.save
			redirect_to list_todos_path(params[:list_id]) 
		else
			redirect_to new_list_todo_path(params[:list_id])
		end
	end

	def edit
		@todo = Todo.find params[:id]
	end

	def update
		@todo = Todo.find params[:id]
		@todo.update_attributes params[:todo]
		if @todo.save
			redirect_to list_todos_path(@todo.list) 
		else
			redirect_to edit_todo_path(@todo) 
		end
	end

	def destroy
		todo = Todo.find(params[:id]).destroy
		redirect_to list_todos_path(todo.list)
	end

end