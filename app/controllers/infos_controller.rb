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
    if @info.save
      file = @info.get_file
      file_info = file.read
      file_value = 0
        if file_info.blank?
        flash[:error] = "Arquivo sem dados!"
        @info.destroy
        elsif file_info.split("\n").count <= 1
        flash[:error] = "Conteúdo inválido!"
        @info.destroy
        end
          
          file_info.split("\n").each_with_index do |line, index|
            line = line.split("\t")
              if line.size !=6
                flash[:notice] = "Conteúdo inválido!"
                @info.destroy  #como parar o loop aqui?
              end #se colocar else não soma última linha >_<
            next unless index > 0
            @sale = Sale.new() #como chamar outra classe?
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

  def @sale.parse_and_save(line) 
    buyer = line [0],
    description = line[1],
    unity_price = line[2],
    quantity = line[3],
    address = line[4],
    supplier = line[5]
  end  

  private
  def set_info
    @info = Info.find(params[:id])  	
  end

  def info_params
    params.require(:info).permit(:name, :attachment)
  end
end