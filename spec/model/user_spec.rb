require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Oscar', email: 'a@mail.com', password: '123456') }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
  it 'should have many records' do
    t = User.reflect_on_association(:records)
    expect(t.macro).to eq(:has_many)
  end
  it 'should have many groups' do
    t = User.reflect_on_association(:groups)
    expect(t.macro).to eq(:has_many)
  end
end
