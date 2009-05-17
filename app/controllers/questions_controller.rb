class QuestionsController < ApplicationController
  
  before_filter :login_required, :except => [:random]
  caches_page :random
  
  # GET /questions/flagged
  def flagged
    @questions = Question.flagged.paginate :page => params[:page], :order => 'flag_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end
  
  # GET /questions/random/:page
  def random
    @questions = Question.active.paginate :page => params[:page], :order => 'created_at desc'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
      format.js { render :json => @questions.collect{ |q| { :question => q.question, :answer => eval(q.answer) } }.to_json }
    end
  end
  
  # GET /questions
  # GET /questions.xml
  def index
    @questions = Question.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.xml
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        
        expire_random
        
        format.html { redirect_to(questions_url) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:notice] = 'Question was successfully updated.'
        
        expire_random
        
        format.html { redirect_to(questions_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def expire_random
    count = Question.count
    1.upto((count / 30) + 1) do |i|
      expire_page :controller => :questions, :action => :random, :format => :js, :page => i  
    end
  end
end
