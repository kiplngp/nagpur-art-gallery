class ArtistPhotosController < ApplicationController
	
   before_filter :login_required, :except => [ ]
   
  
  def index
    @artist_photos = Artist.find_by_urlname(params[:id])
    
  end

  # Show Artwork
  def show
    @artist_photo = ArtistPhoto.find_by_urlname(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artist_photo }
    end
  end

 
  
  def new
    @artist_photo = ArtistPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @artist_photo }
    end
  end
  
  
  def create
    @artist_photo = ArtistPhoto.new(params[:artist_photo])

    respond_to do |format|
      if @artist_photo.save
        flash[:notice] = 'ArtistPhoto was successfully created.'
        format.html { redirect_to("/artists/#{@artist_photo.artist_id}") }
        format.xml  { render :xml => @artist_photo, :status => :created, :location => @artist_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @artist_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

 
   def edit
     @artist_photo = ArtistPhoto.find_by_urlname(params[:id])
     @category = Category.all
     @subcategory = SubCategory.find_all_by_category_id(@artist_photo.category_id)
     @title = "artist_photos"
   end
   
 
  
  def update
    @artist_photo = ArtistPhoto.find_by_urlname(params[:id])

    respond_to do |format|
      if @artist_photo.update_attributes(params[:artist_photo])
        flash[:notice] = 'ArtistPhoto was successfully updated.'
        format.html { redirect_to("/artists/#{@artist_photo.artist_id}") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @artist_photo.errors, :status => :unprocessable_entity }
      end
    end
  end


  
  def destroy
    @artist_photo = ArtistPhoto.find_by_urlname(params[:id])
    @artist_photo.destroy

    respond_to do |format|
      format.html { redirect_to("/artists/#{@artist_photo.artist_id}") }
      format.xml  { head :ok }
    end
  end
  
  # Show slider Photo
  def slider
  	@artist_photos = ArtistPhoto.find(:all, :conditions=>"set_slider='1'")
  	@title = "slider"
  end
  
end
