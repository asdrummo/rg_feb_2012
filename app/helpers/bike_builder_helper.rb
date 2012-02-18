module BikeBuilderHelper

  def sort_link_helper(text, param, component, compartment)
    key = param
    key += "_reverse" if params[:sort] == param
    
    options = {
        :url => {:action => compartment, :sort => key},
        :update => 'component_grid',    
    }
    html_options = {
      :title => "Sort by this field",
      :href => url_for(:action => compartment, :sort => key, :type => component, :compartment => compartment ),
      :remote => true
    }
    link_to text, options, html_options, 
  end
  
  def remote_link_helper(text, update, item, compartment)

    options = {
        :url => {:action => compartment, :item => item},
        :update => update,    
    }
    html_options = {
      :title => text,
      :href => url_for(:action => compartment, :item => item ),
      :remote => true
    }
    link_to text, options, html_options, 
  end


  def sidebar_link_helper(text, compartment)

    options = {
        :url => {:action => compartment, :type => text},
        :update => 'component_grid',    
    }
    html_options = {
      :title => text,
      :href => url_for(:action => compartment, :type => text ),
      :remote => true
    }
    link_to text, options, html_options, 
  end
  
  def package_link_helper(name, package_id, compartment)

    options = {
        :url => {:action => compartment, :package_id => package_id},
        :update => 'component_grid',    
    }
    html_options = {
      :title => name,
      :href => url_for(:action => compartment, :package_id => package_id ),
      :remote => true
    }
    link_to name, options, html_options, 
  end

  def login_link_helper(text, update)

    options = {
        :url => {:controller => 'public', :action => 'login', :type => 'login'},
        :update => update,    
    }
    html_options = {
      :title => text,
      :href => url_for(:controller => 'public', :action => 'login', :type => 'login' ),
      :remote => true
    }
    link_to text, options, html_options, 
  end
end
