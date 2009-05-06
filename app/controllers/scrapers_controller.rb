class ScrapersController < ApplicationController
  # GET /scrapers
  # GET /scrapers.xml
  def index
    @scrapers = Scraper.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scrapers }
    end
  end

  # GET /scrapers/1
  # GET /scrapers/1.xml
  def show
    @scraper = Scraper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scraper }
    end
  end

  # GET /scrapers/new
  # GET /scrapers/new.xml
  def new
    @scraper = Scraper.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scraper }
    end
  end

  # GET /scrapers/1/edit
  def edit
    @scraper = Scraper.find(params[:id])
  end

  # POST /scrapers
  # POST /scrapers.xml
  def create
    @scraper = Scraper.new(params[:scraper])

    respond_to do |format|
      if @scraper.save
        flash[:notice] = 'Scraper was successfully created.'
        format.html { redirect_to(@scraper) }
        format.xml  { render :xml => @scraper, :status => :created, :location => @scraper }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scraper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scrapers/1
  # PUT /scrapers/1.xml
  def update
    @scraper = Scraper.find(params[:id])

    respond_to do |format|
      if @scraper.update_attributes(params[:scraper])
        flash[:notice] = 'Scraper was successfully updated.'
        format.html { redirect_to(@scraper) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scraper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapers/1
  # DELETE /scrapers/1.xml
  def destroy
    @scraper = Scraper.find(params[:id])
    @scraper.destroy

    respond_to do |format|
      format.html { redirect_to(scrapers_url) }
      format.xml  { head :ok }
    end
  end
end
