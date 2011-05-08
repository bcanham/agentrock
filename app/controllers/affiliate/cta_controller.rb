class Affiliate::CtaController < ApplicationController
  # GET /affiliate/cta
  # GET /affiliate/cta.json
  def index
    @affiliate_cta = Affiliate::Ctum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliate_cta }
    end
  end

  # GET /affiliate/cta/1
  # GET /affiliate/cta/1.json
  def show
    @affiliate_ctum = Affiliate::Ctum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate_ctum }
    end
  end

  # GET /affiliate/cta/new
  # GET /affiliate/cta/new.json
  def new
    @affiliate_ctum = Affiliate::Ctum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliate_ctum }
    end
  end

  # GET /affiliate/cta/1/edit
  def edit
    @affiliate_ctum = Affiliate::Ctum.find(params[:id])
  end

  # POST /affiliate/cta
  # POST /affiliate/cta.json
  def create
    @affiliate_ctum = Affiliate::Ctum.new(params[:affiliate_ctum])

    respond_to do |format|
      if @affiliate_ctum.save
        format.html { redirect_to @affiliate_ctum, notice: 'Ctum was successfully created.' }
        format.json { render json: @affiliate_ctum, status: :created, location: @affiliate_ctum }
      else
        format.html { render action: "new" }
        format.json { render json: @affiliate_ctum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /affiliate/cta/1
  # PUT /affiliate/cta/1.json
  def update
    @affiliate_ctum = Affiliate::Ctum.find(params[:id])

    respond_to do |format|
      if @affiliate_ctum.update_attributes(params[:affiliate_ctum])
        format.html { redirect_to @affiliate_ctum, notice: 'Ctum was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiliate_ctum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliate/cta/1
  # DELETE /affiliate/cta/1.json
  def destroy
    @affiliate_ctum = Affiliate::Ctum.find(params[:id])
    @affiliate_ctum.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_cta_url }
      format.json { head :ok }
    end
  end
end
