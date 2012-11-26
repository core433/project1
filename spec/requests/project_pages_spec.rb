require 'spec_helper'

describe "ProjectPages" do
  
	subject { page }

	describe "new project page" do
		before { visit "/projects/new" }

		it { should have_selector('title', content: full_title('New Project')) }
		it { should have_selector('h1', content: 'New Project') }
	end
end