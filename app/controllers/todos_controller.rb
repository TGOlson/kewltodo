class TodosController < ApplicationController

	def index
		@list = List.find(params[:list_id])
		@todos = @list.todos
	end

	def new
		@todo = Todo.new
		@list = List.find(params[:list_id])
		render :new, layout: false
	end

	def create
		@todo = Todo.new params[:todo]
		@todo.list_id = params[:list_id]
		if @todo.save
			render partial: 'layouts/todo', todo: @todo
		else
			render json: { message: 'saving new todo failed' }
		end
	end

	def edit
		@todo = Todo.find params[:id]
	end

	def update
		@todo = Todo.find params[:id]
		@todo.update_attributes params[:todo]
		@todo.toggle_complete if params[:complete]
		if @todo.save
			render partial: 'layouts/todo', todo: @todo
		else
			render json: { message: "todo action failed" }
		end
	end

	def destroy
		todo = Todo.find(params[:id]).destroy
		render json: { message: "todo deleted" }
	end

end