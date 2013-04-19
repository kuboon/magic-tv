module ApplicationHelper
  def tags_tag(tags)
    tags.map do |tag|
      link_to tag, programs_path(tag: tag), class: "badge"
    end.join.html_safe
  end
end
