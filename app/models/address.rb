class Address < ApplicationRecord
  belongs_to :purchace
#  with_options precence: true do
#   validate :postal_code
#   validate :municipality
#   validate :address
#   validate :phone_number
#   validate :purchace
#  end
#   validate :prefecture_id ,numericality: { other_than: 0 }
#   validate :building_name
end
