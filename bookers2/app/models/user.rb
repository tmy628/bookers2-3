class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  # UserモデルとBookCommentモデルを関連付ける
  has_many :favorites, dependent: :destroy
  # Userモデルに関連付けを追加する

  attachment :profile_image

  validates :name,
    presence: true, uniqueness: true, length: { in: 2..20 }
    # 文字数の制限を設ける→length #長さの範囲を2-20文字→in ..
    # 一意性を保つバリデーションの実装（uniqueness: true）
  validates :introduction,
    length: { maximum: 50 }
    # 長さの下限を50文字に設定→minimum
    # presence: trueは、空欄でないことを確認している
end
