class DiasController < ApplicationController
  before_action :set_dia, only: [:show, :edit, :update, :destroy]

  # GET /dias
  # GET /dias.json
  def index
    @dias = Dia.all
  end

  # GET /dias/1
  # GET /dias/1.json
  def show
  end

  # GET /dias/new
  def new
    @dia = Dia.new
  end

  # GET /dias/1/edit
  def edit
  end

  # POST /dias
  # POST /dias.json
  def create
    @dia = Dia.new(dia_params)

    respond_to do |format|
      if @dia.save
        format.html { redirect_to dias_url, notice: 'Dia creado.' }
        format.json { render :show, status: :created, location: @dia }
      else
        format.html { render :new }
        format.json { render json: @dia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dias/1
  # PATCH/PUT /dias/1.json
  def update
    respond_to do |format|
      if @dia.update(dia_params)
        format.html { redirect_to @dia, notice: 'Dia was successfully updated.' }
        format.json { render :show, status: :ok, location: @dia }
      else
        format.html { render :edit }
        format.json { render json: @dia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dias/1
  # DELETE /dias/1.json
  def destroy
    @dia.destroy
    respond_to do |format|
      format.html { redirect_to dias_url, notice: 'Dia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dia
      @dia = Dia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dia_params
      params.require(:dia).permit(:nombre)
    end
end
