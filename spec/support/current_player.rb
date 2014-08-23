shared_examples "a controller with current player" do |actions|
  actions.each do |action|
    # context "user not logged in" do
    #   it "raise SecurityException" do
    #     expect { get action }.to raise_error(SecurityError, /User is not logged in/)
    #   end
    # end

    context "user logged in" do
      extend ControllerMacros
      login_user

      it "set current_player before #{action} action" do
        get action
        expect(controller.current_player).to eq(controller.current_user.player)
      end
    end
  end
end