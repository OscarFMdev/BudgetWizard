require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'has a valid factory' do
    expect(build(:entity)).to be_invalid
  end

  it 'is invalid without a name' do
    entity = build(:entity, name: nil)
    entity.valid?
    expect(entity.errors[:name]).to include("can't be blank")
  end
end
