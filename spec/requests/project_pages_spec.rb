require 'spec_helper'

describe "ProjectPages" do
  
	subject { page }

	describe "new project page" do
		before { visit "/projects/new" }

		it { should have_selector('title', content: full_title('New Project')) }
		it { should have_selector('h1', content: 'New Project') }
	end

	describe "show project page" do
		let(:user) { FactoryGirl.create(:user) }
		let(:project) { FactoryGirl.create(:project) }
		let(:join) { "Join Project" }
		let(:leave) { "Leave Project" }
		before do
			sign_in user
			visit project_path(project)
		end

		it { should have_selector('title', content: full_title(project.title)) }
		it { should have_selector('h1', content: project.title) }

		describe "user not in project do" do

			it { should have_selector('input', value: join) }

			it "clicking join project should increment user's projects" do
				expect do
					click_button join
				end.to change(user.projects, :count).by(1)
			end

			describe "clicking join project should toggle button" do
				before { click_button join }
				
				it { should have_selector('input', value: leave) }
				
			end
		end

		describe "user in project do" do
			before do
				user.add_project!(project)
				visit project_path(project)
			end

			it { should have_selector('input', value: leave) }

			it "clicking leave project should decrement user's projects" do
				expect do
					click_button leave
				end.to change(user.projects, :count).by(-1)
			end

			describe "clicking leave project should toggle button" do
				before { click_button leave }

				it { should have_selector('input', value: join) }
			end
		end

	end

end




