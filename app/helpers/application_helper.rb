module ApplicationHelper

  def full_title page_title = ""
    base_title = t :title
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def set_image_dog dog, width = "100%", height = "200"
    cl_image_tag dog.image_url ? dog.image_url : "http://imageshack.com/a/img922/7474/6SiM0b.gif", width: width, height: height, class: "image"
  end

  def set_avatar_user user, class_name = "img-circle"
    cl_image_tag user.avatar_url ? user.avatar_url : "http://imageshack.com/a/img922/7474/6SiM0b.gif", size: "50x50", class: "img-circle"
  end

    def set_avatar_user_header user, class_name = "img-circle"
    cl_image_tag user.avatar_url ? user.avatar_url : "http://imageshack.com/a/img922/7474/6SiM0b.gif", size: "20x20", class: "img-circle"
  end

  def current_user? user
    user == current_user
  end

  def link_to_add_fields name, f, type
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render type.to_s + "_fields", f: builder, c: f
    end
    link_to name, "#", class: "add_fields add",
      data: {id: id, fields: fields.gsub("\n", "")}
  end
end
