class Comment < ActiveRecord::Base
  belongs_to :photo
  validates :owner_id, :content, :presence => true

end
