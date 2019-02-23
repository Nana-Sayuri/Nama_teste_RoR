
class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
    @infos = Info.all
  end

  def new
    @info = Info.new
  end

  def create
    @info = Info.new(info_params)
    if @info.save #carrierwave precisa salvar o arquivo para acessar
      file = @info.get_file
      file_info = file.read
      file_value = 0 #set pra retomar o calculo da receita das venda
        if file_info.blank?
        @info.destroy
        redirect_to infos_url, notice:"Arquivo sem dados!"
        elsif file_info.split("\n").count <= 1
        @info.destroy
        redirect_to infos_url, notice:"Conteúdo inválido!"
        elsif           
          file_info.split("\n").each_with_index do |line, index|
            line = line.split("\t")
            next unless index > 0
            @sale = Sale.new() #como chamar outra classe? precisa manter o 
            @sale_buyer = line [0],
            @sale_description = line[1],
            @sale_unity_price = line[2],
            @sale_quantity = line[3],
            @sale_address = line[4],
            @sale_supplier = line[5]
            file_value += line[2].to_f * line[3].to_i  #calculando mas está atribuindo?
          end
        file_value
        redirect_to infos_url, notice: "O arquivo #{@info.name} foi adicionado com sucesso. O total de vendas foi de #{file_value}" 
        end
      else
      #destroy ?
      render "new"
    end  
  end

  def show
  end

  def destroy
    @info = Info.find(params[:id])
    @info.destroy
    redirect_to infos_path, notice: "O arquivo #{@info.name} foi excluído."
  end


  private
  def set_info
    @info = Info.find(params[:id])    
  end

  def info_params
    params.require(:info).permit(:name, :attachment)
  end
end