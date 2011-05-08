class Affiliate::CampaignsController < ApplicationController
  # GET /affiliate/campaigns
  # GET /affiliate/campaigns.json
  def index
    @affiliate_campaigns = Affiliate::Campaign.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliate_campaigns }
    end
  end

  # GET /affiliate/campaigns/1
  # GET /affiliate/campaigns/1.json
  def show
    @affiliate_campaign = Affiliate::Campaign.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate_campaign }
    end
  end

  # GET /affiliate/campaigns/new
  # GET /affiliate/campaigns/new.json
  def new
    @affiliate_campaign = Affiliate::Campaign.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliate_campaign }
    end
  end

  # GET /affiliate/campaigns/1/edit
  def edit
    @affiliate_campaign = Affiliate::Campaign.find(params[:id])
  end

  # POST /affiliate/campaigns
  # POST /affiliate/campaigns.json
  def create
    @affiliate_campaign = Affiliate::Campaign.new(params[:affiliate_campaign])

    respond_to do |format|
      if @affiliate_campaign.save
        format.html { redirect_to @affiliate_campaign, notice: 'Campaign was successfully created.' }
        format.json { render json: @affiliate_campaign, status: :created, location: @affiliate_campaign }
      else
        format.html { render action: "new" }
        format.json { render json: @affiliate_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /affiliate/campaigns/1
  # PUT /affiliate/campaigns/1.json
  def update
    @affiliate_campaign = Affiliate::Campaign.find(params[:id])

    respond_to do |format|
      if @affiliate_campaign.update_attributes(params[:affiliate_campaign])
        format.html { redirect_to @affiliate_campaign, notice: 'Campaign was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiliate_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliate/campaigns/1
  # DELETE /affiliate/campaigns/1.json
  def destroy
    @affiliate_campaign = Affiliate::Campaign.find(params[:id])
    @affiliate_campaign.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_campaigns_url }
      format.json { head :ok }
    end
  end
end
