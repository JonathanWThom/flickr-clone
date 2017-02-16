include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :photo do
    image { fixture_file_upload(Rails.root.join('spec', 'asset_specs', 'photos', 'bob.jpg'), 'image/jpg') }
    owner_id 1
  end
end
