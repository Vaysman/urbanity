class TeamDecorator < Draper::Decorator
  delegate_all

  def size
    object.members.size
  end

  def actions_for(player)
    buttons = h.link_to("Show", object, class: "btn btn-info", role: "button")
    buttons << h.link_to("Edit", h.edit_team_path(object), class: "btn btn-primary", role: "button") if player.own_team?(object)
    h.content_tag(:div, buttons, class: "btn-group")
  end
end
