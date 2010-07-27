class SubdomainsController < ApplicationController
	respond_to :html
	#before_filter :authenticate_user!, :except => [:show, :index]
	#before_filter :ensure_created_by!, :only => [:edit, :update, :destroy]



  # GET /subdomains
  # GET /subdomains.xml
  def index
    @subdomains = Subdomain.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subdomains }
    end
  end

  # GET /subdomains/1
  # GET /subdomains/1.xml
  def show
    if @subdomain = Subdomain.first(:conditions => { :name => request.subdomain })            
	    respond_with(@subdomain)
	    
	    respond_to do |format|
      	format.html # show.html.erb
      	format.xml  { render :xml => @subdomain }
    	end   
	  else
	  	render_404
	  end


  end

  # GET /subdomains/new
  # GET /subdomains/new.xml
  def new
    @subdomain = Subdomain.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subdomain }
    end
  end

  # GET /subdomains/1/edit
  def edit
    @subdomain = Subdomain.find(params[:id])
  end

  # POST /subdomains
  # POST /subdomains.xml
  def create
    @subdomain = Subdomain.new(params[:subdomain])

    respond_to do |format|
      if @subdomain.save
        format.html { redirect_to(@subdomain, :notice => 'Subdomain was successfully created.') }
        format.xml  { render :xml => @subdomain, :status => :created, :location => @subdomain }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subdomain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subdomains/1
  # PUT /subdomains/1.xml
  def update
    @subdomain = Subdomain.find(params[:id])

    respond_to do |format|
      if @subdomain.update_attributes(params[:subdomain])
        format.html { redirect_to(@subdomain, :notice => 'Subdomain was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subdomain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subdomains/1
  # DELETE /subdomains/1.xml
  def destroy
    @subdomain = Subdomain.find(params[:id])
    @subdomain.delete

    respond_to do |format|
      format.html { redirect_to(subdomains_url) }
      format.xml  { head :ok }
    end
  end
end
