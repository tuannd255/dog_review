module ApplicationHelper

  def full_title page_title = ""
    base_title = t :title
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def set_image_dog dog
    image_tag dog.image_url ? dog.image_url : "http://imageshack.com/a/img922/7474/6SiM0b.gif", size: "310x200", class: "image"
  end
end
