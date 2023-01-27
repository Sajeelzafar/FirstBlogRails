require_relative '../rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'Sajeel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Sajeel.')}

    before { subject.save }

    it 'Name must be present' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'Should have posts counter greater than or equal to zero' do
        subject.posts_counter = -1
        expect(subject).to_not be_valid
    end

    it 'Should contain a link to photo' do
        subject.photo = nil
        expect(subject).to_not be_valid
    end

    it 'should contain bio' do
        subject.bio = nil
        expect(subject).to_not be_valid
    end
end