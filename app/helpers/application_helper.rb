module ApplicationHelper
  def image_tag_for_user(user)
    if user.photo
      cl_image_tag user.photo.path, width: 100, height: 100, class: 'card-avatar'
    else
      image_tag("http://via.placeholder.com/100x100")
    end
  end
end
