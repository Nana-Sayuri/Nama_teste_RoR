class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create #carrierwave permite visualizar dados
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to resumes_path, notice: "O arquivo #{@resume.name} foi adicionado com sucesso."
    else
      render "new"
    end
  end

  def show #alternativa pra testar o model e parsear os dados
    if params[:resume]
      file = params[:resume][:process_file] 
      redirect_to resumes_path, notice: "O arquivo foi adicionado com sucesso. O total de vendas foi R$#{file_value}"
      set_name = "dados"
      @resume.save
    else
      redirect_to resumes_path, notice: "Erro"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice: "O arquivo #{@resume.name} foi excluído."
  end
  
  private
  def set_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:process_file, {attachment: []})
  end
end
