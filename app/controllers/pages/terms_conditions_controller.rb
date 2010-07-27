class Pages::TermsConditionsController < ApplicationController
  # GET /pages/terms_conditions
  # GET /pages/terms_conditions.xml
  def index

  end

  # GET /pages/terms_conditions/1
  # GET /pages/terms_conditions/1.xml
  def show
    @pages_terms_condition = Pages::TermsCondition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pages_terms_condition }
    end
  end

  # GET /pages/terms_conditions/new
  # GET /pages/terms_conditions/new.xml
  def new
    @pages_terms_condition = Pages::TermsCondition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pages_terms_condition }
    end
  end

  # GET /pages/terms_conditions/1/edit
  def edit
    @pages_terms_condition = Pages::TermsCondition.find(params[:id])
  end

  # POST /pages/terms_conditions
  # POST /pages/terms_conditions.xml
  def create
    @pages_terms_condition = Pages::TermsCondition.new(params[:pages_terms_condition])

    respond_to do |format|
      if @pages_terms_condition.save
        format.html { redirect_to(@pages_terms_condition, :notice => 'Terms condition was successfully created.') }
        format.xml  { render :xml => @pages_terms_condition, :status => :created, :location => @pages_terms_condition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pages_terms_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/terms_conditions/1
  # PUT /pages/terms_conditions/1.xml
  def update
    @pages_terms_condition = Pages::TermsCondition.find(params[:id])

    respond_to do |format|
      if @pages_terms_condition.update_attributes(params[:pages_terms_condition])
        format.html { redirect_to(@pages_terms_condition, :notice => 'Terms condition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pages_terms_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/terms_conditions/1
  # DELETE /pages/terms_conditions/1.xml
  def destroy
    @pages_terms_condition = Pages::TermsCondition.find(params[:id])
    @pages_terms_condition.destroy

    respond_to do |format|
      format.html { redirect_to(pages_terms_conditions_url) }
      format.xml  { head :ok }
    end
  end
end
