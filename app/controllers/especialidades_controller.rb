class EspecialidadesController < ApplicationController
  before_action :set_especialidade, only: [:show, :edit, :update, :destroy]

  # GET /especialidades
  # GET /especialidades.json
  PAGE_SIZE = 5
  def index
  
      
      @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @especialidades = Especialidade.where("lower(descripcion) LIKE '%#{@keywords.downcase}%'").order("descripcion ASC" )
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Especialidade.where("lower(descripcion) LIKE '%#{@keywords.downcase}%'").count

       else
     @especialidades = Especialidade.order('descripcion ASC').offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Especialidade.count
   end
   @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ? 
                       number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /especialidades/1
  # GET /especialidades/1.json
  def show
  end

  # GET /especialidades/new
  def new
    @especialidade = Especialidade.new
  end

  # GET /especialidades/1/edit
  def edit
  end

  # POST /especialidades
  # POST /especialidades.json
  def create
    @especialidade = Especialidade.new(especialidade_params)

    respond_to do |format|
      if @especialidade.save
        format.html { redirect_to especialidades_url, notice: 'Especialidade was successfully created.' }
        format.json { render :show, status: :created, location: @especialidade }
      else
        format.html { render :new }
        format.json { render json: @especialidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especialidades/1
  # PATCH/PUT /especialidades/1.json
  def update
    respond_to do |format|
      if @especialidade.update(especialidade_params)
        format.html { redirect_to especialidades_url, notice: 'Especialidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @especialidade }
      else
        format.html { render :edit }
        format.json { render json: @especialidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /especialidades/1
  # DELETE /especialidades/1.json
  def destroy
    @especialidade.destroy
    respond_to do |format|
      format.html { redirect_to especialidades_url, notice: 'Especialidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_especialidade
      @especialidade = Especialidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def especialidade_params
      params.require(:especialidade).permit(:descripcion, :codigo)
    end
end
