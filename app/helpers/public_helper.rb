module PublicHelper
  def sort_link_helper(text, param, component)
    key = param
    key += "_reverse" if "name" == param
    options = {
        :url => {:action => 'sort_components', :sort => key, :component => component},
        :update => 'table',
        :before => "Element.show('spinner')",
        :success => "Element.hide('spinner')",
        :remote => true
    }
    html_options = {
      :title => "Sort by this field",
      :href => url_for(:action => 'sort_components', :sort => key)
    }
    #link_to_remote(text, options, html_options)
    link_to(text, options, html_options)
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
    
    def us_states
        [
          ['Alabama', 'AL'],
          ['Alaska', 'AK'],
          ['Arizona', 'AZ'],
          ['Arkansas', 'AR'],
          ['California', 'CA'],
          ['Colorado', 'CO'],
          ['Connecticut', 'CT'],
          ['Delaware', 'DE'],
          ['District of Columbia', 'DC'],
          ['Florida', 'FL'],
          ['Georgia', 'GA'],
          ['Hawaii', 'HI'],
          ['Idaho', 'ID'],
          ['Illinois', 'IL'],
          ['Indiana', 'IN'],
          ['Iowa', 'IA'],
          ['Kansas', 'KS'],
          ['Kentucky', 'KY'],
          ['Louisiana', 'LA'],
          ['Maine', 'ME'],
          ['Maryland', 'MD'],
          ['Massachusetts', 'MA'],
          ['Michigan', 'MI'],
          ['Minnesota', 'MN'],
          ['Mississippi', 'MS'],
          ['Missouri', 'MO'],
          ['Montana', 'MT'],
          ['Nebraska', 'NE'],
          ['Nevada', 'NV'],
          ['New Hampshire', 'NH'],
          ['New Jersey', 'NJ'],
          ['New Mexico', 'NM'],
          ['New York', 'NY'],
          ['North Carolina', 'NC'],
          ['North Dakota', 'ND'],
          ['Ohio', 'OH'],
          ['Oklahoma', 'OK'],
          ['Oregon', 'OR'],
          ['Pennsylvania', 'PA'],
          ['Puerto Rico', 'PR'],
          ['Rhode Island', 'RI'],
          ['South Carolina', 'SC'],
          ['South Dakota', 'SD'],
          ['Tennessee', 'TN'],
          ['Texas', 'TX'],
          ['Utah', 'UT'],
          ['Vermont', 'VT'],
          ['Virginia', 'VA'],
          ['Washington', 'WA'],
          ['West Virginia', 'WV'],
          ['Wisconsin', 'WI'],
          ['Wyoming', 'WY']
        ]
    end
    
end
