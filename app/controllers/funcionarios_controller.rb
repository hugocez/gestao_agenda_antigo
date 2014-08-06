class FuncionariosController < ApplicationController
  
  before_action :signed_in_user
  before_action :admin_user, only: :destroy
  
  def index
    empresa_id = encontrar_empresa
    
    @funcionarios = Funcionario.where(["empresa_id = ?", empresa_id]).paginate(page: params[:page])
  end


  def show
    @funcionario = Funcionario.find(params[:id])
  end


  def new
    @funcionario = Funcionario.new
  end


  def edit
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    p = "123456"
    name = params[:funcionario][:nome].split
    empresa_id = encontrar_empresa
    @funcionario.empresa_id = empresa_id
        
      if @funcionario.save
        user = User.create(name: params[:funcionario][:nome], user_name: name[0] + "." + name[-1], password: p, password_confirmation: p, funcionario_id: @funcionario.id)
        func = @funcionario.update(user_id: user.id)
        flash[:success] = "Funcionario Criado com Sucesso."
        redirect_to @funcionario
      else
        render :new
      end
  end

  def update
      if @funcionario.update(funcionario_params)
        redirect_to @funcionario, notice: 'Funcionario was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
           Funcionario.find(params[:id]).destroy
      redirect_to funcionarios_url, notice: 'Funcionario was successfully destroyed.'
  end

  private

    def funcionario_params
      params.require(:funcionario).permit(:nome, :user_id)
    end
    
    def encontrar_empresa
      user = current_user
      func = Funcionario.where(["user_id = ?", user.id]).first
      func.empresa_id
    end
end
