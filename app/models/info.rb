class Info < ApplicationRecord
   mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   validates :name, presence: true # Make sure the owner's name is present.
   
  def get_file()
  	file_to_open = File.join(Rails.root, 'public', "#{self.attachment_url}")
    file = File.open(file_to_open, "rb") #depois fechar?
    file
  end

end
