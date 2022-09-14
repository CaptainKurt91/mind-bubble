module ApplicationHelper
  def link_to_previous_page(link_title)
    return unless session[:previous_pages]

    link_to_if(
      session[:previous_pages].present? && session[:previous_pages].size > 1,
      link_title,
      session[:previous_pages].first
    )
  end
end
