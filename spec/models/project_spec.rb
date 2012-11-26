require 'spec_helper'

describe Project do
  
	let(:project) { FactoryGirl.create(:project) }
	
	subject { project }

	it { should respond_to(:title) }
	it { should respond_to(:reverse_rel_projects) }
	it { should respond_to(:users) }
	it { should respond_to(:has_user?) }
	it { should respond_to(:add_user!) }
	it { should respond_to(:remove_user!) }

	describe "it should not allow an empty title" do
		before { project.title = " " }
		it { should_not be_valid }
	end

	describe "its title should be under 50 chars" do
		before { project.title = 'a' * 51 }
		it { should_not be_valid }
	end

	describe "has user" do
		let (:user) { FactoryGirl.create(:user) }
		before do
			project.add_user!(user)
		end

		it { should be_has_user(user) }
		its(:users) { should include(user) }

		describe "and remove user" do
			before { project.remove_user!(user) }

			it { should_not be_has_user(user) }
			its(:users) { should_not include(user) }
		end
	end

end
