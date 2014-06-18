class Register
  attr :items

  def initialize
    @items = Hash.new(0)
  end

  def ring_up(item, args)
    @items[item] += args[:quantity]
  end

  def total
    total = 0
    items.each do |item, quantity|
      case item
      when 'Frozen Pizza'
        total += quantity * 5
      when 'Corn'
        if (quantity % 5 == 0) 
          total += quantity / 5 * 2.00
        else
          bundles = quantity / 5
          singles = quantity % 5
          total += bundles * 2.00 + singles * 0.50
        end
      when 'Ground Beef'
        total += (quantity * 4.99).round(2)
      when /Mayfield Ice Cream/
        if (quantity % 2 == 0) 
          if item =~ /^Chocolate/
            if Time.now.strftime("%A") == 'Wednesday'
              total += quantity / 2 * 5.99
            else
              total += quantity * 5.99
            end
          else
            total += quantity * 5.99
          end
        else
          if item =~ /^Chocolate/
            if Time.now.strftime("%A") == 'Wednesday'
              total += (quantity / 2) * 5.99 + (quantity % 2) * 5.99
            else
              total += quantity * 5.99
            end
          else
            total += quantity * 5.99
          end
        end
      when 'Mango'
        if Time.now.strftime("%A") == 'Monday'
          total += quantity * 0.50
        else
          total += quantity * 1.00
        end
      end
    end
    total
  end

end
