class GameDecorator < Draper::Decorator
  delegate_all

  def start
    clock_icon +
    format_timedate(object.start)
  end

  def registration_end
    clock_icon +
    format_timedate(object.registration_end)
  end

  def registred_teams_count
    5
  end

  def registred_teams_list
    h.content_tag(:div, class: "list-group") {
      ((1..5).map { |i| team_line(i)}).join.html_safe
    }
  end

  private

  def team_line(name)
    h.link_to(team_line_badge(name) + "Team #{name}", "#", class: "list-group-item")
  end

  def team_line_badge(count)
    h.content_tag(:span, h.pluralize(count, "member"), class: "badge")
  end

  def clock_icon
    h.content_tag(:span, class: "glyphicon glyphicon-time") {}.html_safe
  end

  def format_timedate(timedate)
    timedate.strftime(" %d.%m.%Y %H:%S%z")
  end
end
