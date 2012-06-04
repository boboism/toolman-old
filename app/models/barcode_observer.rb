class BarcodeObserver < ActiveRecord::Observer
  require 'barby'
  require 'barby/outputter/png_outputter'
  require 'barby/barcode/code_128'
  require 'barby/barcode/qr_code'

  observe :tool_material, :tool_part

  def after_validation(record)
    generate_barcode(record)
    generate_qrcode(record)
  end

  protected

  def generate_barcode(record)
    path = '/tmp/code128b.png'

    barcode_options = {}
    barcode_options[:height] = 38
    
    barcode = Barby::Code128B.new(record.barcode_content)
    File.open(path, 'w'){|f| f.write barcode.to_png(barcode_options)}

    file_options = {}
    file_options[:filename] = "#{record.barcode_content || DateTime.now}.png"
    file_options[:type] = "image/png"
    file_options[:tempfile] = File.open(path)
    file = ActionDispatch::Http::UploadedFile.new(file_options)

    record.build_barcode unless record.barcode
    record.barcode.archive = file
  end

  def generate_qrcode(record)
    path = '/tmp/rqrcode.png'

    qrcode_options = {}
    qrcode_options[:height] = 38
    
    qrcode = Barby::QrCode.new(record.qrcode_content, :size => 5, :level => :h)
    File.open(path, 'w'){|f| f.write qrcode.to_png(qrcode_options)}

    file_options = {}
    file_options[:filename] = "#{record.qrcode_content || DateTime.now}.png"
    file_options[:type] = "image/png"
    file_options[:tempfile] = File.open(path)
    file = ActionDispatch::Http::UploadedFile.new(file_options)

    record.build_qrcode unless record.qrcode
    record.qrcode.archive = file
  end
end
