require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
  context "user logged in" do
    before do
      sign_out :user
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to be_success
      end
    end
  end
end
