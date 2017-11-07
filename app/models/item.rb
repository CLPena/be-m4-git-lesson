class Item < ApplicationRecord
  belongs_to :category
  has_many   :order_items
  has_many   :orders, through: :order_items

  validates :title,
            :description,
            :price,
            :status,
            :category_id,
            presence: true

  validates_uniqueness_of :title

  validates :image, attachment_presence: true

  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  enum status: [ "active", "retired" ]
end
