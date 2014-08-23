require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  it_behaves_like "a controller with current player", [:show, :edit]

  context "user logged in" do
    login_user

    describe "GET show" do
      it "assigns player variable before action" do 
        get :show
        expect(assigns(:player)).to eq(assigns(:current_player))
      end

      it "returns http success" do
        get :show
        expect(response).to be_success
      end

      it "renders show template" do
        get :show
        expect(response).to render_template(:show)
      end

      it "decorates player and creates helper methods player" do
        get :show
        expect(controller.player).to be_decorated_with PlayerDecorator
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

  context "user not logged in" do
    describe "GET show" do
      it "redirects to login page" do
        get :show
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
