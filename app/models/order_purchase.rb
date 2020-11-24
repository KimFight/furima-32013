class OrderPurchase
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :purchase, :user, :item

  with_options presence: true do

    validates :prefectures_id, numericality: { other_than: 1 }
    validates :postal_code,    format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: "is invalid."}
    validates :municipality
    validates :address  
    validates :phone_number,   format: { with: /\A\d{10,11}\z/, message: "is invalid."}
  
  end

  #presenceテーブル
    validates :user
    validates :item  

    def save
      # orderの情報を保存、「order」という変数へ
      Order.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase: purchase)
      # purchaseの情報を保存
      purchase = Purchase.create(user_id: user.id, item_id: item.id)
    
    end
end