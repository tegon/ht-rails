FactoryGirl.define do
  factory :user do
    name "John Doe"
    email "john@example.org"
    password "test"
    password_confirmation "test"
  end

  # preload do
  #   factory(:john) do
  #     FactoryGirl.create(:user)
  #   end
  # end
end