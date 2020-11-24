class Order < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do

    with_options   format:  { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid."} do
    end

    with_options   format:  { with: /\A[ァ-ヶー－]+\z/, message: "is invalid."} do
    end
    
    validates :prefectures_id
    validates :postal_code
    validates :municipality
    validates :address
    validates :building_name
    validates :phone_number
    validates :purchase
end

end