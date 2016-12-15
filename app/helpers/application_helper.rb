module ApplicationHelper

  def full_title page_title = ""
    base_title = t :title
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def set_image_dog dog, width = "100%", height = "200"
    cl_image_tag dog.image_url ? dog.image_url : "http://imageshack.com/a/img922/7474/6SiM0b.gif",
      width: width, height: height, class: "image"
  end

  def set_image_event event, width = "75%"
    cl_image_tag event.image_url ? event.image_url : "http://imageshack.com/a/img922/7474/6SiM0b.gif",
      width: width, class: "image-event"
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

  def check_favorite dog
    Favorite.find_by user: current_user, dog: dog
  end

  def set_color_height dog, dogs
    dog.height == dogs.max {|a, b| a[:height] <=> b[:height] }[:height] ? "text-primary" : "text-danger"
  end

  def set_color_weight dog, dogs
    dog.weight == dogs.max {|a, b| a[:weight] <=> b[:weight] }[:weight] ? "text-primary" : "text-danger"
  end

  def set_color_avg dog, dogs
    dog.avg_life_expectancy == dogs.max {|a, b| a[:avg_life_expectancy] <=> b[:avg_life_expectancy] }[:avg_life_expectancy] ? "text-primary" : "text-danger"
  end

  def load_user_event event
    UserEvent.find_by user: current_user, event: event
  end
end
