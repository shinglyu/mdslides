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
      if params[:use_demo] == "true"
         demo_path = File.join(Rails.root, 'public',  'demo.md')
         demo_md = File.read(demo_path)
         @slide.md = demo_md
      else
         @slide.md = '#' + params[:slide][:title] + "\n\n---\n"
      end
      @slide.user_id = current_user.id
      @slide.save
      redirect_to edit_slide_path(@slide)
   end

   def create_demo
      @slide = Slide.new()
      @slide.title = 'Getting Started'
      demo_md = File.read("/demo.md")
      @slide.md = demo_md
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
