class EnfermerosController < ApplicationController
  before_action :set_enfermero, only: [:show, :edit, :update, :destroy]

  # GET /enfermeros
  # GET /enfermeros.json
  def index
    @enfermeros = Enfermero.all
  end

  # GET /enfermeros/1
  # GET /enfermeros/1.json
  def show
  end

  # GET /enfermeros/new
  def new
    @enfermero = Enfermero.new
  end

  # GET /enfermeros/1/edit
  def edit
  end

  # POST /enfermeros
  # POST /enfermeros.json
  def create
    @enfermero = Enfermero.new(enfermero_params)

    respond_to do |format|
      if @enfermero.save
        format.html { redirect_to @enfermero, notice: 'Enfermero was successfully created.' }
        format.json { render :show, status: :created, location: @enfermero }
      else
        format.html { render :new }
        format.json { render json: @enfermero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enfermeros/1
  # PATCH/PUT /enfermeros/1.json
  def update
    respond_to do |format|
      if @enfermero.update(enfermero_params)
        format.html { redirect_to @enfermero, notice: 'Enfermero was successfully updated.' }
        format.json { render :show, status: :ok, location: @enfermero }
      else
        format.html { render :edit }
        format.json { render json: @enfermero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enfermeros/1
  # DELETE /enfermeros/1.json
  def destroy
    @enfermero.destroy
    respond_to do |format|
      format.html { redirect_to enfermeros_url, notice: 'Enfermero was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enfermero
      @enfermero = Enfermero.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enfermero_params
      params.require(:enfermero).permit(:ci, :nro_registro, :nombre, :apellido, :direccion, :ciudade_id, :cargo_id, :telefono, :celular, :contacto_familiar, :correo, :foto)
    end
end
