class ComponentPackage < ActiveRecord::Base
  has_many :line_items
  
  def assign_component_to_package(package, component)
    @component_package = ComponentPackage.find(params[:id])
    @frame_models = FrameModel.find(:all)
    @seat_posts = SeatPost.find(:all)
    if params[:frame_model]
      session[:frame_model_id] = params[:frame_model]
    else
      session[:frame_model_id] = 'no session'
    end
    
    if params[:seat_post_id]
      session[:seat_post_id] = params[:frame_model]
    else
      session[:seat_post_id] = 'no session'
    end
  

    
  end
end
