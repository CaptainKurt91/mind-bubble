module ApplicationHelper
  def link_to_previous_page(link_title)
    return if session[:previous_pages].nil?

    url = session[:previous_pages][-2]
    url_w_params = ""

    unless url.nil?
      url_w_params = url + (url.include?('?') ? '&' : '?') + 'is_back=true'
    end

    link_to_if(
      session[:previous_pages].present? && session[:previous_pages].size > 1,
      link_title,
      url_w_params,
    )
  end
end
