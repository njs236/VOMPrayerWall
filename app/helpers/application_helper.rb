module ApplicationHelper
  
  def fontawesomeimagewithurl (type, icon, cssclass, url)
    content_tag :a do |a|
      a.href = url
      icon(type, icon, cssclass)
    end
      
  end
end
