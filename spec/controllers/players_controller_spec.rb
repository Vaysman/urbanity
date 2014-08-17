require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  it_behaves_like "a controller with current player", [:show, :edit]

  context "user logged in" do
    login_user

    describe "GET show" do
      it "returns http success" do
        get :show
        expect(response).to be_success
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit
        expect(response).to be_success
      end
    end

    # describe "GET update" do
    #   it "returns http success" do
    #     get :update
    #     expect(response).to be_success
    #   end
    # end
  end
end
