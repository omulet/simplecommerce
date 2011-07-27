module Sass::Script::Functions
 def hex(decimal)
   Sass::Script::String.new("%02x" % decimal)
 end
   
 def hsb(h,s,b)
   assert_type h, :Number
   assert_type s, :Number
   assert_type b, :Number
   alpha = Sass::Script::Number.new(1)
   h, s, b = [h, s, b].map { |a| a.value.to_f }
   l = (2 - s / 100) * b / 2
   s = s * b / (l < 50 ? l * 2 : 200 - l * 2) rescue 0 
   Sass::Script::Color.new(:hue => h, :saturation => s, :lightness => l, :alpha => alpha.value)
 end
 
 def get_contrast(color, dark = Sass::Script::Color.new([0,0,0]), light = Sass::Script::Color.new([255,255,255]))
   assert_type color, :Color
   yiq = ( (color.red*299) + (color.green*587) + (color.blue*114) ) / 1000;
   yiq >= 128 ? dark : light
 end
 
 # Using color luminosity to calculate the difference between the given colors.
 # The returned value should be bigger than 5 for best readability.
 def get_contrast_diff(color1, color2)
   assert_type color1, :Color
   assert_type color2, :Color
   l1 = 0.2126 * (color1.red.to_f/255)**2.2 + 0.7152 * (color1.green.to_f/255)**2.2 + 0.0722 * (color1.blue.to_f/255)**2.2
   l2 = 0.2126 * (color2.red.to_f/255)**2.2 + 0.7152 * (color2.green.to_f/255)**2.2 + 0.0722 * (color2.blue.to_f/255)**2.2
   
   diff = l1 > l2 ? (l1+0.05) / (l2+0.05) : (l2+0.05) / (l1+0.05)
   Sass::Script::Number.new(diff)
 end

 def get_luminosity(color)
   assert_type color, :Color
   l = 0.2126 * (color.red.to_f/255)**2.2 + 0.7152 * (color.green.to_f/255)**2.2 + 0.0722 * (color.blue.to_f/255)**2.2
   Sass::Script::Number.new(l)
 end

end