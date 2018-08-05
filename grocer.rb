require 'pry'


def consolidate_cart(cart)
  cart_hash = {}
  
  cart.each do |item|
    #binding.pry
      item.each do |item_name, item_info|
        #binding.pry
          cart_hash[item_name] ||= item_info
          cart_hash[item_name][:count] ||= 0
          cart_hash[item_name][:count] += 1
      end
  end
  cart_hash
end



def apply_coupons(cart, coupons)
  coupons.each do |discount|
    #binding.pry
    coupon = discount[:item]
    if cart[coupon] && cart[coupon][:count] >= discount[:num]
      if cart["#{coupon} W/COUPON"]
        cart["#{coupon} W/COUPON"][:count] += 1
      else
        cart["#{coupon} W/COUPON"] = {:count => 1, :price => discount[:cost]}
        cart["#{coupon} W/COUPON"][:clearance] = cart[coupon][:clearance]
      end
      cart[coupon][:count] -= discount[:num]
    end
  end
  cart
end



def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
