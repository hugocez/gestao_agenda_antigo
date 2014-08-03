class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy]

  def index
    @empresas = Empresa.all
  end

  def show
  end

  def new
    @empresa = Empresa.new
  end

  def edit
  end

  def create
    @empresa = Empresa.new(empresa_params)

      if @empresa.save
        p = "123456"
        func = Funcionario.create(nome: "ADMINISTRADOR", empresa_id: @empresa.id)
        user = User.create(name: params[:empresa][:razao_social], user_name: "ADMINISTRADOR", password: p, password_confirmation: p, funcionario_id: func.id, admin: true)
        func = func.update(user_id: user.id)
        sign_in user
        flash[:success] = "Seja Bem Vindo ao Sistema Exemplo!"
        redirect_to @empresa
      else
        render :new
        
      end
  end

  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: 'Empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url, notice: 'Empresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:razao_social, :cnpj, :dt_abertura)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
end
