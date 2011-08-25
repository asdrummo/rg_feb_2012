module PublicHelper
  def sort_link_helper(text, param, component)
    key = param
    key += "_reverse" if params[:sort] == param
    options = {
        :url => {:action => 'sort_components', :sort => key, :component => component},
        :update => 'table',
        :before => "Element.show('spinner')",
        :success => "Element.hide('spinner')"
    }
    html_options = {
      :title => "Sort by this field",
      :href => url_for(:action => 'sort_components', :sort => key)
    }
    link_to_remote(text, options, html_options)
  end
  
  def nav_link_helper(text, param)
    
    options = {
        :url => {:action => param},
        :update => 'list',
        :before => "Element.show('spinner')",
        :success => "Element.hide('spinner')"
    }
    html_options = {
      :title => ('link to' + param),
      :href => url_for(:controller => '', :action => param)
    }
    link_to_remote(text, options, html_options)
  end

    def pagination_links_remote(paginator)
      page_options = {:window_size => 1}
      pagination_links_each(paginator, page_options) do |n|
        options = {
          :url => {:action => 'sort_components', :params => params.merge({:page => n})},
          :update => 'sort_components',
          :before => "Element.show('spinner')",
          :success => "Element.hide('spinner')"
        }
        html_options = {:href => url_for(:action => 'sort_components', :params => params.merge({:page => n}))}
        link_to_remote(n.to_s, options, html_options)
      end
    end

    def sort_td_class_helper(param)
      result = 'class="sortup"' if params[:sort] == param
      result = 'class="sortdown"' if params[:sort] == param + "_reverse"
      return result
    end
end
