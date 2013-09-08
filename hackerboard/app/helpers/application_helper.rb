module ApplicationHelper
  def error_for(record, attribute)
    message = record.errors[attribute].first
    content_tag :span, message, class: 'error' if message
  end

  def profile_link(user)
    "".html_safe.tap do |html|
      html << link_to(gravatar(user.email, alt: user.name))
      html << link_to(user.name, user_path(user))
    end
  end

  def gravatar(email, options = {})
    hash = Digest::MD5.hexdigest(email.to_s)
    url = "http://www.gravatar.com/avatar/#{ hash }.jpg?d=mm"
    image_tag url, options
  end
end