module ApplicationHelper
require "uri"

  def full_title(page_name = "")
    base_title = "app"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
  def text_url_to_link(text)
    URI.extract(text, ["http", "https"]).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << " traget=\"_blank\">" << url << "</a>"
      text.gsub!(url, sub_text)
    end
    
    return text
  end
end