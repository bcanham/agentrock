class Affiliate::AccountsController < ApplicationController
  # GET /affiliate/accounts
  # GET /affiliate/accounts.json
  def index
    @affiliate_accounts = Affiliate::Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliate_accounts }
    end
  end

  # GET /affiliate/accounts/1
  # GET /affiliate/accounts/1.json
  def show
    @affiliate_account = Affiliate::Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate_account }
    end
  end

  # GET /affiliate/accounts/new
  # GET /affiliate/accounts/new.json
  def new
    @affiliate_account = Affiliate::Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliate_account }
    end
  end

  # GET /affiliate/accounts/1/edit
  def edit
    @affiliate_account = Affiliate::Account.find(params[:id])
  end

  # POST /affiliate/accounts
  # POST /affiliate/accounts.json
  def create
    @affiliate_account = Affiliate::Account.new(params[:affiliate_account])

    respond_to do |format|
      if @affiliate_account.save
        format.html { redirect_to @affiliate_account, notice: 'Account was successfully created.' }
        format.json { render json: @affiliate_account, status: :created, location: @affiliate_account }
      else
        format.html { render action: "new" }
        format.json { render json: @affiliate_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /affiliate/accounts/1
  # PUT /affiliate/accounts/1.json
  def update
    @affiliate_account = Affiliate::Account.find(params[:id])

    respond_to do |format|
      if @affiliate_account.update_attributes(params[:affiliate_account])
        format.html { redirect_to @affiliate_account, notice: 'Account was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiliate_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliate/accounts/1
  # DELETE /affiliate/accounts/1.json
  def destroy
    @affiliate_account = Affiliate::Account.find(params[:id])
    @affiliate_account.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_accounts_url }
      format.json { head :ok }
    end
  end
end
