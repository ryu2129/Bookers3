class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy

  validates :name,
            uniqueness: { case_sensitive: :false },
            length: { minimum:2, maximum:20 }

  validates :introduction, length: { maximum:50 }

  attachment :profile_image, destroy: false
end
