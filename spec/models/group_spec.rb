require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'has a valid factory' do
    expect(build(:group)).to be_valid
  end

  it 'is invalid without a name' do
    group = build(:group, name: nil)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end
end
