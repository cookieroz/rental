class VillasController < ApplicationController
  # GET /villas
  # GET /villas.json

  def index
    @villas = Villa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @villas }
    end
  end

  # GET /villas/1
  # GET /villas/1.json
  def show
    @villa = Villa.find(params[:id])
    @json = @villa.to_gmaps4rails
    @images = @villa.photos

    add_breadcrumb "#{@villa.destination.name}", :destination_path
    add_breadcrumb "Vacation Rentals", villas_path

    add_breadcrumb "#{@villa.name}", villa_path

    #@photo = @villa.photos.build
    @photos = Photo.scoped(:conditions => [ 'villa_id = ?', @villa.id ] )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @villa }
    end
  end

  # GET /villas/new
  # GET /villas/new.json
  def new
    @villa = Villa.new
    @object_new = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @villa }
    end
  end

  # GET /villas/1/edit
  def edit
    @villa = Villa.find(params[:id])
    @object_new = Photo.new
  end

  # POST /villas
  # POST /villas.json
  def create
    #@villa = Villa.new(params[:villa])
    villa_data = params[:villa]
    photo_ids = villa_data.delete :photo_ids
    @villa = Villa.new(villa_data)

    respond_to do |format|
      if @villa.save
        update_photos_with_villa_id photo_ids, @villa

        format.html { redirect_to @villa, notice: 'Villa was successfully created.' }
        format.json { render json: @villa, status: :created, location: @villa }
      else
        @object_new = Photo.new
        format.html { render action: "new" }
        format.json { render json: @villa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /villas/1
  # PUT /villas/1.json
  def update
    @villa = Villa.find(params[:id])
    villa_data = params[:villa]
    photo_ids = villa_data.delete :photo_ids

    respond_to do |format|
      if @villa.update_attributes(villa_data)
        update_photos_with_villa_id photo_ids, @villa

        format.html { redirect_to @villa, notice: 'Villa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @villa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villas/1
  # DELETE /villas/1.json
  def destroy
    @villa = Villa.find(params[:id])
    @villa.destroy

    respond_to do |format|
      format.html { redirect_to villas_url }
      format.json { head :no_content }
    end
  end

  def sort_photos
    params[:photos].each_with_index do |id, index|
      Photo.update_all({position: index+1}, {id: id})
    end

    render nothing: true
  end

  private
    def update_photos_with_villa_id photo_ids, villa
      photo_ids.split(',').each do |id|
        photo = Photo.where(id: id).first
        if photo.present?
          photo.imageable = villa
          photo.save
        end
      end
    end
end
