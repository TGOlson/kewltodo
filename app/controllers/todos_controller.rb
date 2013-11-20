class TodosController < ApplicationController

	def index
		@todos = Todo.all
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new params[:todo]
		redirect_to todos_path if @todo.save
	end

	def edit
		@todo = Todo.find params[:id]
	end

	def update
		@todo = Todo.find params[:id]
		@todo.update_attributes params[:todo]
		redirect_to todos_path if @todo.save
	end

	def destroy
		Todo.find(params[:id]).destroy
		redirect_to todos_path
	end

end