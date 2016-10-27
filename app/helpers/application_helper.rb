module ApplicationHelper

  def full_title page_title = ""
    base_title = t :title
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def set_image_dog dog, width = "100%", height = "200"
    image_tag dog.image_url ? dog.image_url : "http://imageshack.com/a/img922/7474/6SiM0b.gif", width: width, height: height, class: "image"
  end

  def set_avatar_user user, class_name = "img-circle"
    image_tag user.avatar_url ? user.avatar_url : "http://imageshack.com/a/img922/7474/6SiM0b.gif", size: "50x50", class: "img-circle"
  end

  def current_user? user
    user == current_user
  end
end
