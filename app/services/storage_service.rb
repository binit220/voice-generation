class StorageService
  def self.upload(file)
    Cloudinary::Uploader.upload(
      file,
      resource_type: :video
    )["secure_url"]
  end
end