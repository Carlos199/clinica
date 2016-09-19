class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]
  PAGE_SIZE = 10

  # GET /units
  # GET /units.json
  def index
    @page = (params[:page] || 0).to_i

    if params[:keywords].present?
      @keywords = params[:keywords]
      @units = Unit.where("unaccent(lower(name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'").order(:name)
                      .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
      number_of_records = Unit.where("unaccent(lower(name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'").count
    else
      @units = Unit.order(:name).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
      number_of_records = Unit.count
    end
    @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ? 
                        number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /units/1
  # GET /units/1.json
  def show
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to units_url, notice: 'Unidad Creada.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to units_url, notice: 'Unidad Actualizada.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:name)
    end
end
