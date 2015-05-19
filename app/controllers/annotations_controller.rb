class AnnotationsController < ApplicationController
  before_action :set_annotation, only: [:show, :edit, :update, :destroy]
  before_action :set_image, except: [:update, :edit, :show, :destroy]
  # GET /annotations
  # GET /annotations.json
  def index
    @annotations = Annotation.where(image: @image)
  end

  # GET /annotations/1
  # GET /annotations/1.json
  def show
  end

  # GET /annotations/new
  def new
    @annotation = Annotation.new
  end

  # GET /annotations/1/edit
  def edit
  end

  # POST /annotations
  # POST /annotations.json
  def create
    # FIXME: this seems ghetto.  There should be a way to rewrite
    # params using strong params, and get this done...
    @annotation = Annotation.new(annotation_params)
    @image.annotations << @annotation
    shapes_params_array.each do |p|
      @annotation.shapes << Shape.new(p)
    end
    
    respond_to do |format|
      if @annotation.save
        format.html { redirect_to @annotation, notice: 'Annotation was successfully created.' }
        format.json { render :show, status: :created, location: @annotation }
      else
        format.html { render :new }
        format.json { render json: @annotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annotations/1
  # PATCH/PUT /annotations/1.json
  def update
    respond_to do |format|
      if @annotation.update(annotation_params)
        format.html { redirect_to @annotation, notice: 'Annotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @annotation }
      else
        format.html { render :edit }
        format.json { render json: @annotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annotations/1
  # DELETE /annotations/1.json
  def destroy
    @annotation.destroy
    respond_to do |format|
      format.html { redirect_to image_annotations_url(@annotation.image), notice: 'Annotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annotation
      @annotation = Annotation.find(params[:id])
    end

    def set_image
      @image = Image.find(params[:image_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def annotation_params
      # the annotorious library sends the params as json, but the without a content-type header
      # FIXME:  this will not work for regular html get req
      params.require(:annotation).permit(:src, :text, :context, shapes: [:type, geometry: [:x, :y, :width, :height]]).slice(:src, :text)
    end

    def shapes_params_array
      
      params[:annotation][:shapes].map do |s|
        s.require(:geometry).permit(:x, :y, :width, :height)
      end
    end
end
