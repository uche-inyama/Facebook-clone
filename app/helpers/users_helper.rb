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

  def edit_delete_post(posts)
    if posts.empty?
      content_tag(:h4, "You don't have any posts yet!", class: "text-center font-weight-bold mb-3 mt-3")
    else
      content_tag :div, class: "mb-5" do
        render 'users/edit_delete'
      end
    end
  end

  def friend_request(current_user, user)
    if current_user.pending_friends.include?user
      content_tag :h6, "Friend request sent"
    elsif current_user.friends.include?user
      form_tag "/users/#{current_user.id}/friendships/#{user.id}", method: :delete, authenticity_token: "cf50faa3fe97702ca1ae" do
        submit_tag 'Unfriend'
      end
    else
      form_tag "users/#{user.id}/friend_requests", authenticity_token: "cf50faa3fe97702ca1ae" do
        submit_tag 'Add friend'
      end
    end
  end
end
