class RegistrationsController < Devise::RegistrationsController
  after_action :create_player

  protected

  def create_player
    if resource.persisted?
      resource.create_player()
    end
  end
end
