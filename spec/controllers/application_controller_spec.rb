require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def after_sign_in_path_for(resource)
      super resource
    end
  end

  it "redirect to games page after logged in" do
    user = mock_model(User)
    expect(controller.after_sign_in_path_for(user)).to eq(games_path)
  end
end
