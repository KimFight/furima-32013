class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_burden
  belongs_to :shipment_source
  belongs_to :day

  belongs_to :user
  has_one_attached :image 
  has_one :purchase
  
  with_options presence: true do
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_burden_id
      validates :shipment_source_id
      validates :day_id
    end
      validates :image
      validates :explanation
      validates :name
      validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}
  end

#def previous
#  item.category.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
#end

#def next
#  item.category.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
#end

end
