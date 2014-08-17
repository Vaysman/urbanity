require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  context "user not logged in" do
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
    login_user

    describe "GET index" do
      it "redirect to games" do
        get :index
        expect(response).to redirect_to(games_path)
      end
    end
  end
end
