class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_create :update_counter
  after_delete :update_counter

  def update_counter
    post = Post.find(post_id)
    post.update(likes_counter: post.likes.count)
  end
end
