class PagesController < ApplicationController
	
   before_filter :login_required, :except => [ ]
   
  
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

 
  def show
    @page = Page.find_by_urlname(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

 
  def edit
    @page = Page.find_by_urlname(params[:id])
  end

 
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to "/content-pages/" }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def update
    @page = Page.find_by_urlname(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to "/content-pages/" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @page = Page.find_by_urlname(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to "/content-pages/"  }
      format.xml  { head :ok }
    end
  end
end
