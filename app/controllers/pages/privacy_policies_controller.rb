class Pages::PrivacyPoliciesController < ApplicationController
  # GET /pages/privacy_policies
  # GET /pages/privacy_policies.xml
  def index

  end

  # GET /pages/privacy_policies/1
  # GET /pages/privacy_policies/1.xml
  def show
    @pages_privacy_policy = Pages::PrivacyPolicy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pages_privacy_policy }
    end
  end

  # GET /pages/privacy_policies/new
  # GET /pages/privacy_policies/new.xml
  def new
    @pages_privacy_policy = Pages::PrivacyPolicy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pages_privacy_policy }
    end
  end

  # GET /pages/privacy_policies/1/edit
  def edit
    @pages_privacy_policy = Pages::PrivacyPolicy.find(params[:id])
  end

  # POST /pages/privacy_policies
  # POST /pages/privacy_policies.xml
  def create
    @pages_privacy_policy = Pages::PrivacyPolicy.new(params[:pages_privacy_policy])

    respond_to do |format|
      if @pages_privacy_policy.save
        format.html { redirect_to(@pages_privacy_policy, :notice => 'Privacy policy was successfully created.') }
        format.xml  { render :xml => @pages_privacy_policy, :status => :created, :location => @pages_privacy_policy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pages_privacy_policy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/privacy_policies/1
  # PUT /pages/privacy_policies/1.xml
  def update
    @pages_privacy_policy = Pages::PrivacyPolicy.find(params[:id])

    respond_to do |format|
      if @pages_privacy_policy.update_attributes(params[:pages_privacy_policy])
        format.html { redirect_to(@pages_privacy_policy, :notice => 'Privacy policy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pages_privacy_policy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/privacy_policies/1
  # DELETE /pages/privacy_policies/1.xml
  def destroy
    @pages_privacy_policy = Pages::PrivacyPolicy.find(params[:id])
    @pages_privacy_policy.destroy

    respond_to do |format|
      format.html { redirect_to(pages_privacy_policies_url) }
      format.xml  { head :ok }
    end
  end
end
