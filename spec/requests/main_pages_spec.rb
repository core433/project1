require 'spec_helper'

describe "MainPages" do

	subject { page }

	describe "Home page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit root_path }

		describe "should have proper title" do
			it { should have_selector('title', text: full_title('')) }
			it { should_not have_selector('title', text: '| Home') }
		end

		describe "for non-signed in user" do
			it { should have_selector('h1', text: 'Project 1') }
		end

		describe "for signed-in user" do
			before do
				sign_in user
				visit root_path
			end

			describe "it should have proper h1" do
				it { should have_selector('h1', text: 'Your Projects') }
			end
		end
	end
end
