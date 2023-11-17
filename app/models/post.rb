class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  after_create :update_counter
  after_delete :update_counter

  def recents(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_counter
    user1 = User.find(author_id)
    user1.update(posts_counter: user1.posts.count)
  end
end
