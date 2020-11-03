class User < ApplicationRecord
  validates :nickname, presence: true
  
  with_options presence: true , format: { with: /\A[\w@-]*[A-Za-z][\w@-]*\z/, message: 'Passwordは半角英数混合にしてください' } do
  validates :password 
  end        

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）文字を使用してください' } do
    validates :family_name_china
    validates :first_name_china 
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角(カナカナ)文字を使用してください' } do
    validates :family_name_kana 
    validates :first_name_kana  
  end
  validates :birthday         , presence: true

  # Include default devinise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
 