require 'spec_helper'

describe 'Todo Page' do
	it 'Can click a button to create a new todo' do	
		visit '/todos'
		page.should have_link '+'
	end


end

### VISIT IS BROKEN