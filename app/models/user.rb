class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy

  validates :introduction, length: { maximum: 50}
  validates :name, presence: true, uniqueness: true, length: { in: 2..20}
  attachment :profile_image
  #登録時にメールアドレスを不要とする(追加)

end
