class SubCategoriesController < ApplicationController

   before_filter :login_required, :except => [ ]
   
 
  def index
    @sub_categories = SubCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_categories }
    end
  end

  
  def show
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_category }
    end
  end

  
  def new
    @sub_category = SubCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_category }
    end
  end

 
  def edit
    @sub_category = SubCategory.find(params[:id])
  end

  
  def create
    @sub_category = SubCategory.new(params[:sub_category])

    respond_to do |format|
      if @sub_category.save
        flash[:notice] = 'SubCategory was successfully created.'
        format.html { redirect_to("/categories/#{@sub_category.category_id}") }
        format.xml  { render :xml => @sub_category, :status => :created, :location => @sub_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sub_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      if @sub_category.update_attributes(params[:sub_category])
        flash[:notice] = 'SubCategory was successfully updated.'
        format.html { redirect_to("/categories/#{@sub_category.category_id}") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_category.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy

    respond_to do |format|
      format.html { redirect_to(sub_categories_url) }
      format.xml  { head :ok }
    end
  end
end
