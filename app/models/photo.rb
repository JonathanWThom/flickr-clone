class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "images/placeholder.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :tags
  has_many :users, :through => :tags
  validates :owner_id, :presence => true

  acts_as_votable

end
