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
  
end
