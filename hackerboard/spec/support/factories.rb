FactoryGirl.define do
  factory :user do
    name "John Doe"
    email "john@example.org"
    password "test"
    password_confirmation "test"
  end

  factory :category do
    name 'Some category'
  end

  factory :question do
    title 'Some question'
    body 'Some details'
    association :user, :category
  end
  # preload do
  #   factory(:john) do
  #     FactoryGirl.create(:user)
  #   end
  # end
end