module ApplicationHelper
  
  include AutoHtml
  
  def format_body(text)
    auto_html(text) do 
      html_escape
      image
      youtube(:width => 400, :height => 250)
      link :target => "_blank", :rel => "nofollow"
      simple_format
    end
  end
end
