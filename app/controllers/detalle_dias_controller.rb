class DetalleDiasController < ApplicationController
  before_action :set_detalle_dia, only: [:show, :edit, :update, :destroy]

  # GET /detalle_dias
  # GET /detalle_dias.json
  def index
    @detalle_dias = DetalleDia.all
  end

  # GET /detalle_dias/1
  # GET /detalle_dias/1.json
  def show
  end

  # GET /detalle_dias/new
  def new
    @detalle_dia = DetalleDia.new
  end

  # GET /detalle_dias/1/edit
  def edit
  end

  # POST /detalle_dias
  # POST /detalle_dias.json
  def create
    @detalle_dia = DetalleDia.new(detalle_dia_params)

    respond_to do |format|
      if @detalle_dia.save
        format.html { redirect_to @detalle_dia, notice: 'Detalle dia was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_dia }
      else
        format.html { render :new }
        format.json { render json: @detalle_dia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_dias/1
  # PATCH/PUT /detalle_dias/1.json
  def update
    respond_to do |format|
      if @detalle_dia.update(detalle_dia_params)
        format.html { redirect_to @detalle_dia, notice: 'Detalle dia was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_dia }
      else
        format.html { render :edit }
        format.json { render json: @detalle_dia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_dias/1
  # DELETE /detalle_dias/1.json
  def destroy
    @detalle_dia.destroy
    respond_to do |format|
      format.html { redirect_to detalle_dias_url, notice: 'Detalle dia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_dia
      @detalle_dia = DetalleDia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_dia_params
      params.require(:detalle_dia).permit(:horaini, :horafin)
    end
end
