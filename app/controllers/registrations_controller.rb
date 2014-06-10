class RegistrationsController < Devise::RegistrationsController
  after_action :create_player
  layout "auth"

  protected

  def create_player
    if resource.persisted?
      resource.create_player(nick: to_nickname(resource))
    end
  end

  def to_nickname(user)
    "#{user.email}"
  end
end
