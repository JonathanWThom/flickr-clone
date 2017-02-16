require 'rails_helper'

describe Comment do
  it { should belong_to :photo }
  it { should validate_presence_of :owner_id }
  it { should validate_presence_of :content }
end
