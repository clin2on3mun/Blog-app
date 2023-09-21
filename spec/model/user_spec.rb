require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'student in MIT.', posts_counter: 0) }
  before { subject.save }
  it 'test if name is nil to be invalid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'test if subject is valid' do
    expect(subject).to be_valid
  end

  it 'test if bio is null to invalid' do
    subject.bio
    expect(subject).to be_valid
  end
  it 'test validation posts_counter' do
    subject.posts_counter = 'one'
    expect(subject).to_not be_valid
  end
  it 'test validation posts_counter' do
    subject.posts_counter = 5
    expect(subject.posts_counter).to eq(5)
  end
  it 'test validation posts_counter' do
    subject.posts_counter
    expect(subject).to be_valid
  end
end
