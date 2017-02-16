require 'rails_helper'

describe User do
  it { should validate_presence_of :name }
  it { should have_many(:photos).through(:tags) }

  # it 'sends an email' do
  #   expect { subject.send_instructions }
  #     .to change { ActionMailer::Base.deliveries.count }.by(1)
  # end
end
