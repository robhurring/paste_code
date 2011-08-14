class PastesController < ApplicationController
  # GET /pastes
  # GET /pastes.json
  def index
    @pastes = Paste.public.order('updated_at DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pastes }
    end
  end

  # GET /pastes/1
  # GET /pastes/1.json
  def show
    @paste = Paste.public.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paste }
    end
  end
  
  # GET /pastes/private/1
  # GET /pastes/private/1.json
  def private
    @paste = Paste.private.where(:token => params[:token]).first

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @paste }
    end
  end

  # GET /pastes/new
  # GET /pastes/new.json
  def new
    @paste = Paste.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paste }
    end
  end

  # GET /pastes/1/edit
  def edit
    @paste = Paste.find(params[:id])
  end

  # POST /pastes
  # POST /pastes.json
  def create
    @paste = Paste.new(params[:paste])
    @paste.public = params[:scope] == 'public'
    
    respond_to do |format|
      if @paste.save
        format.html { redirect_to path_to_paste, notice: 'Paste was successfully created.' }
        format.json { render json: @paste, status: :created, location: @paste }
      else
        format.html { render action: "new" }
        format.json { render json: @paste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pastes/1
  # PUT /pastes/1.json
  def update
    @paste = Paste.find(params[:id])

    respond_to do |format|
      if @paste.update_attributes(params[:paste])
        format.html { redirect_to path_to_paste, notice: 'Paste was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @paste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pastes/1
  # DELETE /pastes/1.json
  def destroy
    @paste = Paste.find(params[:id])
    @paste.destroy

    respond_to do |format|
      format.html { redirect_to pastes_url }
      format.json { head :ok }
    end
  end
  
private

  def path_to_paste
    @paste.public? ? @paste : private_paste_path(@paste.token)
  end
end
