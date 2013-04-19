module ApplicationHelper
  def tags_tag(tags)
    tags.map do |tag|
      link = @current_tags.include?(tag) ? "#" : programs_path(tag: (@current_tags + [tag]).join(','))
      link_to tag, link, class: "badge"
    end.join.html_safe
  end
end
