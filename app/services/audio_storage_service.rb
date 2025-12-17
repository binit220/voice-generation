class AudioStorageService
  def self.upload(file_path, public_id)
    Cloudinary::Uploader.upload(
      file_path,
      resource_type: "video", # audio = video in cloudinary
      public_id: public_id
    )["secure_url"]
  end
end
