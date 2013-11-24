require 'spec_helper'

describe ListsController do
	
    let!(:list){ List.create name: 'Sweet Test Instance' }

	it '#index' do
		get :index
		expect(assigns(:lists)).to eq [list]
	end

	it '#new' do
		get :new
		expect(assigns(:list)).to be_an_instance_of List
	end

	it '#create' do
		expect{
		post :create, list: {  name: 'cool' }
		}.to change(List, :count).by 1
	end
end