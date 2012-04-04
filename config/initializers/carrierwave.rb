CarrierWave.configure do |config|
  # Amazon S3 settings
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Settings.s3_credentials.access_key_id,
    :aws_secret_access_key  => Settings.s3_credentials.secret_access_key,
    :region                 => 'eu-west-1'
  }
  config.fog_directory  = 'warranties'
  # END Amazon S3 settings

  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false

    WarrantyUploader.class_eval do
      def cache_dir
        "#{Rails.root}/tmp/uploads"
      end

      def store_dir
        "#{Rails.root}/tmp/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
end
