PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/bin/wkhtmltopdf.sh'
  config.default_options = {
    :encoding => "UTF-8",
    :page_size => "A4",
    :margin_top => "0.2in",
    :margin_right => "0.2in",
    :margin_bottom => "0.2in",
    :margin_left => "0.2in",
    :disable_smart_shrinking => false,
    :print_media_type => true
  }
  config.root_url = "http://localhost" # Use only if your external hostname is unavailable on the server.
end
