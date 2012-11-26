FactoryGirl.define do
	factory :user do
		name					"Daniel Chang"
		email					"dan@chang.com"
		password				"foobar"
		password_confirmation	"foobar"
	end

	factory :project do
		title					"MyProject"
	end
end
