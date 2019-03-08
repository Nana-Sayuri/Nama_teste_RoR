class Resume < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, :attachment, presence: true # Make sure the owner's name is present.

  attr_accessor :process_file
    
    def self.process(file)
      raise "File can't be blank!" if file.blank?
      raise "Content invalid!" if file.split("\n").count <= 1
        file_value = 0
        
        transaction do # Transaction to garantee that all the data has been saved and prevent duplicated data.
          file.split("\n").each_with_index do |line, index|
            line = line.split("\t")
            next unless index > 0 # Headers
            resume = Resume.new
            resume.parse_and_save(line)
            file_value += line[2].to_f * line[3].to_i
          end
        end
      file_value
    end
  
    def parse_and_save(line)
      raise 'Ocorreu um erro com o conteúdo do arquivo.' if line.count != 6 # #Raise error if file has missing content 
      self.buyer = line[0]
      self.description = line[1]
      self.unit_price = line[2].to_f
      self.quantity = line[3].to_i      
      self.address = line[4]
      self.provider = line[5]
      save
    end
end