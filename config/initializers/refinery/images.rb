Refinery::Images.configure do |config|
  # Configures the maximum allowed upload size (in bytes) for an image
  config.max_image_size = 2621440

  # Configure how many images per page should be displayed when a dialog is presented that contains images
  # config.pages_per_dialog = 18

  # Configure how many images per page should be displayed when a dialog is presented that
  # contains images and image resize options
  # config.pages_per_dialog_that_have_size_options = 12

  # Configure how many images per page should be displayed in the list of images in the admin area
  # config.pages_per_admin_index = 20

  # Configure image sizes
  config.user_image_sizes = {:small=>"110x110>", :medium=>"225x255>", :large=>"450x450>"}

  # Configure white-listed mime types for validation
  # config.whitelisted_mime_types = ["image/jpeg", "image/png", "image/gif", "image/tiff"]

  # Configure image view options
  # config.image_views = [:grid, :list]

  # Configure default image view
  # config.preferred_image_view = :grid

  # Configure S3 (you can also use ENV for this)
  # The s3_backend setting by default defers to the core setting for this but can be set just for images.
  # config.s3_backend = Refinery::Core.s3_backend
  # config.s3_bucket_name = ENV['aerefinery']
  # config.s3_access_key_id = ENV['AKIAJDIGEOQGSIJRRY3A']
  # config.s3_secret_access_key = ENV['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']
  # config.s3_region = ENV['S3_REGION']

  # Configure Dragonfly
  # This is where in the middleware stack to insert the Dragonfly middleware
  # config.dragonfly_insert_before = "ActionDispatch::Callbacks"
  # config.dragonfly_secret = "342305e96c222fdce78ca5901f88dfe9bb45c101b55277c6"
  # If you decide to trust file extensions replace :ext below with :format
  # config.dragonfly_url_format = "/system/images/:job/:basename.:ext"
  # config.datastore_root_path = "/Users/TALLANT/Sites/rickrockstar/public/system/refinery/images"
  # config.trust_file_extensions = false

end
