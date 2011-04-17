class CasestorriesController < InheritedResources::Base
    load_and_authorize_resource
    respond_to :js, :only => [:create, :update]
    
#    helper_method :sort_column, :sort_direction 

#    def index
#      @casestorries = Casestory.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
#    end
#    def new
#      render :layout => 'admin'
#    end
    
    def update 
      @casestorry = Casestorry.find(params[:id])
      @casestorry.update_attributes(params[:casestorry])
      @casestorry.image_content_type = MIME::Types.type_for(@casestorry.image.original_filename).first.to_s if @casestorry.image.original_filename.present?
      @casestorry.save
      update! {casestorry_path(@casestorry)}
    end
  
    def create  
      @casestorry = Casestorry.new(params[:casestorry])
      @casestorry.image_content_type = MIME::Types.type_for(@casestorry.image.original_filename).first.to_s if @casestorry.image.original_filename.present?
      @casestorry.save
      create! {casestorry_path(@casestorry)}
    end
  
#private  
#  def sort_column  
#    Illustration.column_names.include?(params[:sort]) ? params[:sort] : "title"  
#  end 
#  
#  def sort_direction  
#    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
#  end
    
    
end

