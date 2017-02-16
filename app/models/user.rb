class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tags
  has_many :photos, :through => :tags

  validates :name, :presence => true

  after_create :welcome_send

  acts_as_voter
  def welcome_send
    UserMailer.welcome_email(self).deliver
  end

end
