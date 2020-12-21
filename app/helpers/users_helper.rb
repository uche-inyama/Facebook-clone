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

  def edit_delete_post(current_user, posts)
    if posts.empty?
      content_tag(:h4, "You don't have any posts yet!", class: "text-center font-weight-bold mb-3 mt-3")
    else
      content_tag :div, class: "mb-5" do
        posts.each do |post|
          render 'users/edit_delete'
        end
      end
    end
  end
end
