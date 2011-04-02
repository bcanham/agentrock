class FacebooksController < ApplicationController
  # GET /facebooks
  # GET /facebooks.xml
  def index
    @facebooks = Facebook.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facebooks }
    end
  end

  # GET /facebooks/1
  # GET /facebooks/1.xml
  def show
    @facebook = Facebook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @facebook }
    end
  end

  # GET /facebooks/new
  # GET /facebooks/new.xml
  def new
    @facebook = Facebook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @facebook }
    end
  end

  # GET /facebooks/1/edit
  def edit
    @facebook = Facebook.find(params[:id])
  end

  # POST /facebooks
  # POST /facebooks.xml
  def create
    @facebook = Facebook.new(params[:facebook])

    respond_to do |format|
      if @facebook.save
        format.html { redirect_to(@facebook, :notice => 'Facebook was successfully created.') }
        format.xml  { render :xml => @facebook, :status => :created, :location => @facebook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @facebook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /facebooks/1
  # PUT /facebooks/1.xml
  def update
    @facebook = Facebook.find(params[:id])

    respond_to do |format|
      if @facebook.update_attributes(params[:facebook])
        format.html { redirect_to(@facebook, :notice => 'Facebook was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @facebook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /facebooks/1
  # DELETE /facebooks/1.xml
  def destroy
    @facebook = Facebook.find(params[:id])
    @facebook.destroy

    respond_to do |format|
      format.html { redirect_to(facebooks_url) }
      format.xml  { head :ok }
    end
  end
end
