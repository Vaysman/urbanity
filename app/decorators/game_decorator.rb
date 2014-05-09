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

  private

  def clock_icon
    h.content_tag(:span, class: "glyphicon glyphicon-time") {}.html_safe
  end

  def format_timedate(timedate)
    timedate.strftime(" %d.%m.%Y %H:%S%z")
  end
end
