require 'spec_helper'

describe User, 'validations' do
  # subject { User.create.errors }
  # # let!(:user)

  # its([:name]) { should_not be_empty }
  # its([:password]) { should_not be_empty }
  # its([:email]) { should_not be_empty }

  # it 'require valid email' do
  #   subject.email = 'invalid'
  #   subject.should_not be_valid
  # end
  it { should allow("John").for(:name) }
  it { should_not allow(nil).for(:name) }

  it { should allow("john@test.org").for(:email) }
  it { should_not allow("invalid").for(:email) }

  it { should allow("test").for(:password) }
  it { should_not allow(nil).for(:password) }

  context 'email uniquess' do
    let!(:user) { 
      User.create!({
        name: 'John Doe',
        email: 'john@example.org',
        password: 'test',
        password_confirmation: 'test'
      })
    }
    
    it { should_not allow(user.email).for(:email) }
  end
end