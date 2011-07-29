module ApplicationHelper
  
  def shorten string, count = 30, expandable = false
    if string.length > count and string =~ /(.{0,#{count-1}}\w*)\s*.*/
      escaped_string = escape_javascript string;
      link = expandable ? (link_to_function(" &hellip;", "$(this).parent().html('#{escaped_string}')", :class => "simple")) : " ..."
      "#{$1}#{link}"
    else
      string
    end
  end
  
end
