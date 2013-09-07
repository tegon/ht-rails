module IntegrationHelper
  def login(email)
    visit login_path

    fill_in 'E-mail', with: "johndoe@example.org"
    fill_in 'Senha', with: "test"
    
    click_button 'Entrar'
  end
end

RSpec.configure do |config| 
  config.include(IntegrationHelper, type: :request)
end