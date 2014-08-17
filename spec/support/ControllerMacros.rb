module ControllerMacros
  def login_user
    before(:each) do
      user = User.new
      user.confirmation_sent_at = Time.now
      user.confirm!
      sign_in :user, user
    end
  end
end 
