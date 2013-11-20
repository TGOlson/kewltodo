require 'spec_helper'

describe TodosController do

	# let(:todo){ Todo.new description: 'Cool test todo', complete: false}

	describe 'todos' do
		it '#index' do
			get :index
			response.status.should eq 200
   	        expect(assigns(:todos)).to eq(Todo.all)
		end
	end
end