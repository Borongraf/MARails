class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :songs
  has_many :mus_albums
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
