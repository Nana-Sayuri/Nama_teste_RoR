class Sale < ApplicationRecord

  attr_accessor :process_file

  def self.process_file(file)

    result = {}
    total = 0

    transaction do
      file.split("\n").each_with_index do |line, index|
        line = line.split("\t")
        if index > 0
          create_sale(line)
          total += total(line[2].to_f, line[3].to_i)
        end
      end
    end
    result[:total] = total
    result[:status] = true
    result
  end

  def self.create_sale(line)
  	transaction do
      Sale.create({
        buyer: line[0].force_encoding('UTF-8'),
        description: line[1],
        unity_price: line[2],
        quantity: line[3],
        address: line[4].force_encoding('UTF-8'),
        supplier: line[5].force_encoding('UTF-8')
      })
    end
  end

  def self.total(unity_price, quantity)
    unity_price * quantity
  end
end
