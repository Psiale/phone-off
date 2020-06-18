require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:file) { fixture_file_upload(Rails.root.join('app/assets/images/', 'unnamed.png'), 'image/png') }
  let(:user1) { User.create(name: 'Oscar', email: 'a@mail.com', password: '123456') }
  subject { Group.create(name: 'new record', user: user1, icon: file) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an associated user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user associated to it' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
  it 'should belongs to user' do
    Group.reflect_on_association(:User)
  end
  it 'should have many records' do
    t = Group.reflect_on_association(:records)
    expect(t.macro).to eq(:has_many)
  end

  it 'should have an icon' do
    Group.reflect_on_association(:icon)
  end
end
