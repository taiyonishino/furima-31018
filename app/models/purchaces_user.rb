class PurchacesUser
  include ActiveModel::Model
  attr_accessor :postal_code ,:prefecture_id ,:municipality ,:address ,:building_name ,:phone_number , :item_id, :user_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address    
    validates :phone_number, format: {with: /\A^0\d{9,10}$\z/, message: "11桁以上だと保存できません"}
  end
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :token, presence: true
  
  def save
    purchace = Purchace.create(user_id: user_id ,item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchace_id: purchace.id)
  end
end