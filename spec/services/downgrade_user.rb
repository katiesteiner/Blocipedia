require 'rails_helper'

describe DowngradeUser do
  
  context 'successfully' do

    before do
      @user = create(:user)
      5.times { |n| @user.wikis.create(title: "Wiki-#{n}", private: false) }
      5.times { |n| @user.wikis.create(title: "Wiki-#{n}", private: true) }
    end

    it 'makes the users wiki public' do
      expect(@user.wikis.where(private: true).count).to eq(5)
      DowngradeUser.call(@user)
      expect(@user.wikis.where(private: true).count).to eq(0)
    end
  end
end