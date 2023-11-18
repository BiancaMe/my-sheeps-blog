require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Bianca', photo: 'photo.com.uy', bio: 'developer from Uruguay') }

  before { subject.save }

  it 'Name must not be blank.' do
    expect(subject).to be_valid
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    expect(subject).to be_valid
    subject.posts_counter = -1
    expect(subject).to_not be_valid
    subject.posts_counter = nil
    expect(subject).to_not be_valid
    subject.posts_counter = 5
    expect(subject).to be_valid
  end
end
