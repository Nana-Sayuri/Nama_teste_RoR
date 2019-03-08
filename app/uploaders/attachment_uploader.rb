class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "upload/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(txt)
  end

  def content_type_whitelist
    %w(text)
  end

  uploader = AttachmentUploader.new #depois o retrieve pelo model
end
