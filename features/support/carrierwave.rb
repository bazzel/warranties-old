at_exit do
  # Cleanup files uploaded with CarrierWave
  warranty = Warranty.new.warranty
  store_dir = warranty.store_dir
  cache_dir = warranty.cache_dir
  FileUtils.rm_rf Dir["#{store_dir}/[^.]*", "#{cache_dir}/[^.]*"]
end
