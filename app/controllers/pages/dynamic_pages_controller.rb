class Pages::DynamicPagesController < ApplicationController
  # GET /pages/dynamic_pages
  # GET /pages/dynamic_pages.xml
  def index
    @pages_dynamic_pages = Pages::DynamicPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages_dynamic_pages }
    end
  end

  # GET /pages/dynamic_pages/1
  # GET /pages/dynamic_pages/1.xml
  def show
    @pages_dynamic_page = Pages::DynamicPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pages_dynamic_page }
    end
  end

  # GET /pages/dynamic_pages/new
  # GET /pages/dynamic_pages/new.xml
  def new
    @pages_dynamic_page = Pages::DynamicPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pages_dynamic_page }
    end
  end

  # GET /pages/dynamic_pages/1/edit
  def edit
    @pages_dynamic_page = Pages::DynamicPage.find(params[:id])
  end

  # POST /pages/dynamic_pages
  # POST /pages/dynamic_pages.xml
  def create
    @pages_dynamic_page = Pages::DynamicPage.new(params[:pages_dynamic_page])

    respond_to do |format|
      if @pages_dynamic_page.save
        format.html { redirect_to(@pages_dynamic_page, :notice => 'Dynamic page was successfully created.') }
        format.xml  { render :xml => @pages_dynamic_page, :status => :created, :location => @pages_dynamic_page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pages_dynamic_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/dynamic_pages/1
  # PUT /pages/dynamic_pages/1.xml
  def update
    @pages_dynamic_page = Pages::DynamicPage.find(params[:id])

    respond_to do |format|
      if @pages_dynamic_page.update_attributes(params[:pages_dynamic_page])
        format.html { redirect_to(@pages_dynamic_page, :notice => 'Dynamic page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pages_dynamic_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/dynamic_pages/1
  # DELETE /pages/dynamic_pages/1.xml
  def destroy
    @pages_dynamic_page = Pages::DynamicPage.find(params[:id])
    @pages_dynamic_page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_dynamic_pages_url) }
      format.xml  { head :ok }
    end
  end
end
