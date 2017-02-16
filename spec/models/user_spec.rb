require 'rails_helper'

describe User do
  subject {create :user}
  it { should validate_presence_of :name }
  it { should have_many(:photos).through(:tags) }

  it 'sends an email' do
    expect { subject.welcome_send }
      .to change { ActionMailer::Base.deliveries.count }.by(2)
  end
end
