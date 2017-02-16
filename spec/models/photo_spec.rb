require 'rails_helper'

describe Photo do
  it { should validate_presence_of :owner_id }
  it { should have_many(:users).through(:tags) }
  it { should have_many :comments }
end
