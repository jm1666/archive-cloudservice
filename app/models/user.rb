class User < ActiveRecord::Base
  acts_as_token_authenticatable
  include Gravtastic
  gravtastic :default => 'identicon'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_many :posts
  has_many :comments
end
