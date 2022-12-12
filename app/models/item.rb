class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  has_many :order_details
  validates :name, {presence: true}
  validates :introduction, {presence: true}

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
end