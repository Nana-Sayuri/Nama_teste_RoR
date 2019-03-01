require 'test_helper'

class SaleTest < ActiveSupport::TestCase

  def setup
    @sale = sales(:one)
  end
  
  def file
<<eof
Comprador	descrição	Preço Uniário	Quantidade	Endereço	Fornecedor
João Silva	R$10 off R$20 of food	10.0	2	987 Fake St	Bob's Pizza
Amy Pond	R$30 of awesome for R$10	10.0	5	456 Unreal Rd	Tom's Awesome Shop
Marty McFly	R$20 Sneakers for R$5	5.0	1	123 Fake St	Sneaker Store Emporium
Snake Plissken	R$20 Sneakers for R$5	5.0	4	123 Fake St	Sneaker Store Emporium
eof
  end
  
  test "Test process_file method" do
    Sale.process_file(file)
    sales_count = Sale.count
    assert_equal(sales_count, 6)
  end
end
