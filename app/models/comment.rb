class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_create :update_counter
  after_destroy :update_counter

  def update_counter
    post = Post.find(post_id)
    post.update(comments_counter: post.comments.count)
  end
end
