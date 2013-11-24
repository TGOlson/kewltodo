require 'spec_helper'

describe ListsController do
	
	let!(:list){ List.create name: 'Sweet Test Instance' }
	let(:list_params) { { name: 'cool' }}

	describe '#list' do
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

		it '#edit' do
			get :edit, id: list.id
			expect(assigns(:list).id).to eq list.id
		end

		it '#update' do
			put :update, { id: list.id, list: list_params }
			expect(assigns(:list).name).to eq 'cool'
		end

		it '#destroy' do
			expect{ delete :destroy, id: list.id }.to change{List.count}.by(-1)
		end
	end
end