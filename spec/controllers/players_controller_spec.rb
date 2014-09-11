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
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit
        expect(response).to be_success
      end

      it "renders edit template" do
        get :edit
        expect(response).to render_template(:edit)
      end
    end

    describe "POST update" do
      let(:player) { double("player") }

      before do
        allow(controller).to receive(:player) { player }
        allow(controller).to receive(:player_params) { double }
      end

      context "on success update" do

        before do
          allow(player).to receive(:update) { true }
        end

        it "redirects to player page" do
          post :update
          expect(response).to redirect_to(player_path)
        end

        it "place notice meassage to flash" do
          post :update
          expect(flash[:notice]).to match(/successfully updated/)
        end
      end

      context "on fail update" do
        before do
          allow(player).to receive(:update) { false }
        end

        it "returns http success" do
          post :update
          expect(response).to be_success
        end

        it "renders edit template" do
          post :update
          expect(response).to render_template(:edit)
        end
      end
    end
  end

  context "user not logged in" do
    describe "GET show" do
      it "redirects to login page" do
        get :show
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET edit" do
      it "redirects to login page" do
        get :edit
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST update" do
      it "redirects to login page" do
        post :update
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "params handling" do
    it "player is required" do
      expect(controller.params).to receive(:require).with("player") { self }
      controller.send :player_params
    end

    it "first_name, last_name, bio is required" do
      params = double
      allow(controller.params).to receive(:require) { params }
      expect(params).to receive(:permit).with("first_name", "last_name", "bio")
      controller.send :player_params
    end
  end
end 