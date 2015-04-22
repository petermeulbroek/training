class SelectionsController < ApplicationController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]
  before_action :set_image
  # GET /selections
  # GET /selections.json
  def index
    @selections = Selection.where(image_id: @image)
  end

  # GET /selections/1
  # GET /selections/1.json
  def show
  end

  # GET /selections/new
  def new
    @selection = Selection.new
  end

  # GET /selections/1/edit
  def edit
  end

  # POST /selections
  # POST /selections.json
  def create
    @selection = Selection.new(selection_params)
    @selection.image = @image
    
    respond_to do |format|
      if @selection.save
        format.html { redirect_to image_selection_url(@image, @selection), notice: 'Selection was successfully created.' }
        format.json { render :show, status: :created, location: @selection }
      else
        format.html { render :new }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selections/1
  # PATCH/PUT /selections/1.json
  def update
    respond_to do |format|
      if @selection.update(selection_params)
        format.html { redirect_to image_selection_url(@image, @selection), notice: 'Selection was successfully updated.' }
        format.json { render :show, status: :ok, location: @selection }
      else
        format.html { render :edit }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  def destroy
    @selection.destroy
    respond_to do |format|
      format.html { redirect_to image_selections_url(@image), notice: 'Selection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection
      @selection = Selection.find(params[:id])
    end

    def set_image
      @image = Image.find(params[:image_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_params
      params.require(:selection).permit(:start_x, :start_y, :end_x, :end_y)
    end
end
