require 'spec_helper'

describe ListsController do
	
    let!(:list){ List.create name: 'Sweet Test Instance' }

	it '#index' do
		get :index
		expect(assigns(:lists)).to eq [list]
	end
end