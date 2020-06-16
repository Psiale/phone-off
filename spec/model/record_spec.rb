require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:user1) { User.create(name: 'Oscar', email: 'a@mail.com', password: '123456') }
  subject { Record.new(name: 'new record', amount: 10, author: user1) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a user associated to it' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
  it 'should belongs to author' do
    Record.reflect_on_association(:User)
  end
  it 'should have many groups' do
    t = User.reflect_on_association(:groups)
    expect(t.macro).to eq(:has_many)
  end
end
