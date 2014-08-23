module ControllerMacros
  def login_user
    before(:each) do
      user = FactoryGirl.create(:user_with_player)
      sign_in :user, user
    end
  end
end 
