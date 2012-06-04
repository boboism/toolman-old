class BarcodeGeneratorsController < ApplicationController
  require 'barby'
  require 'barby/outputter/png_outputter'
  require 'barby/barcode/code_128'
  require 'barby/barcode/gs1_128'
  require 'csv'

  def index
  end

  def create
    # @content_type = params[:archive][:archive].original_filename
    # @content_match = @content_type =~ /\.csv$/
    # @barcodes = {}
    # render :index and return
    
    if params[:archive] and params[:archive][:archive] and params[:archive][:archive].original_filename =~ /\.csv$/
      file = params[:archive][:archive]
      @barcodes = {}
      root = Rails.root.join('public','tmp')
      if file
        CSV.foreach(file.tempfile) do |row|
          if row
            barcode = Barby::GS1128.new(row[0],'B', '').to_png(:height => 38, :margin => 0)
            path = "#{(Time.now.to_f*10000000).to_i}.png"
            file = File.open(root.join(path), 'w') {|f| f.write barcode}
            @barcodes[row[0]] = "/tmp/#{path}"
          end
        end
      end
      render :index, :layout => "pdf" and return
    else
      render :new, :notice => 'not csv file' and return
    end
  end

  def show
  end

  def new
  end
end
