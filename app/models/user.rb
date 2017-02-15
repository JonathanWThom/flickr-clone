class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tags
  has_many :photos, :through => :tags

  validates :name, :presence => true
  include ActiveModel::Dirty
end
