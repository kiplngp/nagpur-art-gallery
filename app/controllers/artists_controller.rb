class ArtistsController < ApplicationController
	
  before_filter :login_required, :except => [ ]
  
  
  # Get artists
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artists }
    end
  end

  
  # Show artists information
  def show
    @artist = Artist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artist }
    end
  end

  

  def new
    @artist = Artist.new
    @category = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @artist }
    end
  end


  def create
    @artist = Artist.new(params[:artist])

    respond_to do |format|
      if @artist.save
        flash[:notice] = 'Artist was successfully created.'
        format.html { redirect_to("/artists") }
        format.xml  { render :xml => @artist, :status => :created, :location => @artist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @artist.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  
   def edit
     @artist = Artist.find(params[:id])
     @category = Category.all
   end
   
 
  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        flash[:notice] = 'Artist was successfully updated.'
        format.html { redirect_to("/artists") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @artist.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to(artists_url) }
      format.xml  { head :ok }
    end
  end
  
  #Show Photo
  def showphoto
      @artist = Artist.find(params[:id])
      @subcategory = SubCategory.find_all_by_category_id(@artist.category_id)
  end
  
  
end
