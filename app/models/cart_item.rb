class CartItem < ApplicationRecord
   belongs_to :customer
   belongs_to :item

  def subtotal
    item.with_tax_price * amount
  end

 def validate_into_cart
    cart_items = self.customer.cart_items
    if (amount) == nil
       return (false)
    elsif cart_items.any? {|cart_item| cart_item.item_id == (item_id)} == true
       return (false)
    else
      return (true)
    end
 end
end
