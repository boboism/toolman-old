module ApplicationHelper
  def absolute_image_tag(*args)
    raw(image_tag(*args).sub /src="(.*?)"/, "src=\"#{request.protocol}#{request.host_with_port}" + '\1"')
  end
  def absolute_stylesheet_link_tag(*args)
    raw(stylesheet_link_tag(*args).sub /href="(.*?)"/, "href=\"#{request.protocol}#{request.host_with_port}" + '\1"')
  end
end
