require 'rails_helper'

describe UsersController do

  include TestFactories
  include Devise::TestHelpers
  
  before do
    @user = authenticated_user
    @wiki = wiki
    sign_in @user
  end

describe '#downgrade' do
  let(:user) { create(:user) }
  5.times { |n| user.wikis.create(title: "Wiki-#{n}", private: false) }
  5.times { |n| user.wikis.create(title: "Wiki-#{n}", private: true) }

    context 'successfully' do
      it 'makes the users wiki public' do

        expect(user.wikis.where(private: true).to eq(0))
      end
    end
end
end
