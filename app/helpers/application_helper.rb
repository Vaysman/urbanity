module ApplicationHelper
  def section_title
    content_for(:title) || "No title"
  end
end
