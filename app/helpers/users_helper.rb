# frozen_string_literal: true

module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.first_name, class: 'gravatar')
  end

  def signed_in_create_post?(user, current_user, post)
    if user == current_user
      render 'users/post_form'
    end
  end
end
