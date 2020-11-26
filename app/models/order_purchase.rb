class OrderPurchase
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :purchase, :user_id, :item_id ,:token

  with_options presence: true do

    validates :prefectures_id, numericality: { other_than: 1 }
    validates :postal_code,    format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address  
    validates :phone_number,   format: { with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token
  end

  #presenceテーブル
    validates :user_id, presence: true
    validates :item_id, presence: true

    def save 
      
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      Order.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
     
    end
end