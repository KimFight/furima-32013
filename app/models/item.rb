class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_burden
  belongs_to :shipment_source
  belongs_to :day

  belongs_to :user
  has_one_attached :image  
  
  with_options presence: true do
      validates :category_id,         numericality: { other_than: 1 }
      validates :status_id,           numericality: { other_than: 1 }
      validates :delivery_burden_id,  numericality: { other_than: 1 }
      validates :shipment_source_id,  numericality: { other_than: 1 }
      validates :day_id,              numericality: { other_than: 1 }
      validates :image
      validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}
    end
end
