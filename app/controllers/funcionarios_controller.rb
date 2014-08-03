class FuncionariosController < ApplicationController
  
  def index
    user = current_user
    func = Funcionario.where(["user_id = ?", user.id]).first
    
    func.empresa_id
    
    @funcionarios = Funcionario.where(["empresa_id = ?", func.empresa_id]).paginate(page: params[:page])
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

    
      if @funcionario.save
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
    @funcionario.destroy
      redirect_to funcionarios_url, notice: 'Funcionario was successfully destroyed.'
  end

  private

    def funcionario_params
      params.require(:funcionario).permit(:nome, :user_id)
    end
end
