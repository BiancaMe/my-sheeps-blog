class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_create :increment_counter
  after_destroy :decrement_counter


  def recents(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def increment_counter
    author.increment!(:posts_counter)
  end

  def decrement_counter
    author.decrement!(:posts_counter)
  end
end
