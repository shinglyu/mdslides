class SlidesController < ApplicationController
   before_filter :authenticate_user!
   load_and_authorize_resource

   def slide_params
      params.require(:slide).permit(:title, :md,  :user_id)
   end

   def new
   end

   def index
      @slides = Slide.find(:all, :conditions => ["user_id = :uid", {:uid => current_user.id}])
   end
   
   def create
      @slide = Slide.new(params[:slide].permit(:title))
      @slide.md = '#' + params[:slide][:title] + "\n\n---\n"
      @slide.user_id = current_user.id
      @slide.save
      redirect_to edit_slide_path(@slide)
   end

   def show
      @slide = Slide.find(params[:id])
   end

   def edit
      @slide = Slide.find(params[:id])
   end

   def preview
   end

   def update
      @slide = Slide.find(params[:id])
      @slide.md = params[:slide][:md]
      @slide.save
      redirect_to @slide
   end

   def destroy
      @slide = Slide.find(params[:id])
      @slide.destroy

      redirect_to slides_path 
   end
end
