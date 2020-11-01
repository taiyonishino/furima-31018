class User < ApplicationRecord
  validates :nickname         , presence: true
  validates :family_name_china, presence: true
  validates :first_name_china , presence: true
  validates :family_name_kana , presence: true
  validates :first_name_kana  , presence: true
  validates :birthday         , presence: true
  # Include default devinise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
