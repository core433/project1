require 'spec_helper'

describe RelProject do

	let(:user) { FactoryGirl.create(:user) }
	let(:project) { FactoryGirl.create(:project) }
	let(:rel_project) { user.rel_projects.build(project_id: project.id) }

	subject { rel_project }

	it { should be_valid }

	#describe "accessible attributes" do
	#	it "should not allow access to user_id" do
	#		expect do 
	#			RelProject.new(user_id: user.id)
	#		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
	#	end
	#end

	describe "link methods" do
		it { should respond_to(:user) }
		it { should respond_to(:project) }
		its(:user) { should == user }
		its(:project) { should == project }
	end

	describe "when project id is not present" do
		before { rel_project.project_id = nil }
		it { should_not be_valid }
	end

	describe "when user id is not present" do
		before { rel_project.user_id = nil }
		it { should_not be_valid }
	end

end
