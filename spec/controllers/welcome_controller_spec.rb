require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
  context "user not logged in" do
    before do
      sign_out :user
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to be_success
      end

      it "renders index template" do
        get :index
        expect(response).to render_template(:index, layout: "welcome")
      end
    end
  end

  context "user logged in" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.new
      user.confirmation_sent_at = Time.now
      user.confirm!
      sign_in :user, user
    end

    describe "GET index" do
      it "redirect to games" do
        get :index
        expect(response).to redirect_to(games_path)
      end
    end
  end
end
