class Item < ApplicationRecord
  validates :name          , presence: true
  validates :explanation   , presence: true
  validates :explanation   , length: { maximum: 40 }

  with_options presence: true ,numericality: { other_than: 0 } do
   validates :category_id   
   validates :status_id     
   validates :burden_id     
   validates :prefecture_id 
   validates :days_id       
  end

    validates :prace         , presence: true
    validates :prace         , numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :days
end
