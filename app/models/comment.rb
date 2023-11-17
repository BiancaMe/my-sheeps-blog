class Comment < ApplicationRecord
  after_create :update_counter
  after_delete :update_counter

  def update_counter
    post = Post.find(post_id)
    post.update(comments_counter: post.comments.count)
  end
end
