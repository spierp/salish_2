module ApplicationHelper
  def full_title(page_title)
    base_title = 'Sali.sh'
    if page_title.empty?
      base_title
    else  
      "#{base_title} | #{page_title}"
    end
  end
  
  def select_options(options, current_value)
    options_html = []
    options.each do |option|
      if option == current_value
        options_html << "<option selected>#{option}</option>"
      else
        options_html << "<option>#{option}</option>"
      end
    end
    return options_html.join("\n")
  end
  
  def expression_image(string)
      exp = File.basename(string)
      if exp == "expression1"
        "expression1.jpg"
      elsif exp == "expression2"
        "expression2.jpg"
      elsif exp == "expression3"
        "expression3.jpg"
      elsif exp == "expression4"
        "expression4.jpg"
      elsif exp == "expression5"
        "expression5.jpg"
      elsif exp == "expression6"
        "expression6.jpg"
      elsif exp == "expression7"
        "expression7.jpg"
      elsif exp == "expression8"
        "expression8.jpg"
      elsif exp == "expression9"
        "expression9.jpg"
      elsif exp == "expression10"
        "expression10.jpg"
      elsif exp == "expression11"
        "expression11.jpg"        
     else
      "expression12.jpg"
    end
  end
  
end

