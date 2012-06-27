class DataInjectionsController < ApplicationController

  def index
  end

  def create
    require 'spreadsheet'    

    if params[:archive] and params[:archive][:archive] and params[:archive][:archive].original_filename =~ /\.xls$/
      file = params[:archive][:archive]
      Spreadsheet.open(file.tempfile.path) do |book|
        book.worksheet(0).each do |row|
        row.each{|r| r.strip! if r.is_a? String }
        ft = FacilityType.find_or_create_by_name(:name => row[11]) unless row[11].blank?
        cat = Category.find_or_create_by_name(:name => row[20]) unless row[20].blank?
        sub_cat = SubCategory.find_or_create_by_name(:name => row[21]) unless row[21].blank?
        mnf = Manufacturer.find_or_create_by_name(:name => row[29]) unless row[29].blank?
        agc = Agency.find_or_create_by_name(:name => row[30]) unless row[30].blank?
        shd = SharpenDevice.find_or_create_by_name(:name => row[35]) unless row[35].blank?
        std = SettingDevice.find_or_create_by_name(:name => row[38]) unless row[38].blank?
        pdl = ProductLine.find_or_create_by_name(:name => row[4]) unless row[4].blank?
        fct = FacilityType.find_or_create_by_name(:name => row[11]) unless row[11].blank?
        fcc = FacilityCode.find_or_create_by_name(:name => row[12]) unless row[12].blank?
        wsp = WorkshopProcess.find_or_create_by_name(:name => row[14]) unless row[14].blank?

        tm = ToolMaterial.find_by_tool_no(row[23])
        unless tm
          tm = ToolMaterial.new(:tool_no => row[23],
                                :category_id => cat ? cat.id : nil,
                                :sub_category_id => sub_cat ? sub_cat.id : nil,
                                :model => row[23],
                                :service_quantity => row[31].to_f,
                                :sharpen_part => row[33].to_i == 1,
                                :standardized => row[28].to_i == 1
                               )
          sti = tm.build_stocking_info(:current_quantity => row[3].to_i || 0)
          pui = tm.build_purchase_info(:purchase_no => row[1],
                                       :manufacturer_id => mnf ? mnf.id : nil,
                                       :agency_id => agc ? agc.id : nil,
                                      )
          tei = tm.build_technical_info(:expected_quantity => row[25],
                                        :sharpen_time => 1
                                       )
          tm.save
        else
          tm.service_quantity += (row[31].to_f || 0)
          tm.stocking_info.current_quantity += row[3].to_i || 0
          tm.save
        end
        
        at = AssemblyTool.new(:product_line_id => pdl ? pdl.id : nil,
                              :facility_type_id => fct ? fct.id : nil,
                              :facility_code_id => fcc ? fcc.id : nil,
                              :workshop_process_id => wsp ? wsp.id : nil,
                              :hilt_no => row[24],
                              :processing_position => row[18],
                              :processing_hole => row[19],
                              :tool_part_quantity => row[31],
                              :setting_device_id => std ? std.id : nil,
                              :setting_type_id => 1,
                              :standard_setting_time => row[37].to_i || 0
                             )
        at.engine_models << EngineModel.find_by_id(1) if row[5].to_i == 1
        at.engine_models << EngineModel.find_by_id(2) if row[6].to_i == 1
        at.engine_models << EngineModel.find_by_id(3) if row[7].to_i == 1
        at.engine_models << EngineModel.find_by_id(4) if row[8].to_i == 1
        at.engine_models << EngineModel.find_by_id(5) if row[9].to_i == 1
        at.engine_models << EngineModel.find_by_id(6) if row[10].to_i == 1
        ati = at.items.build(:tool_material_id => tm ? tm.id : nil,
                             :quantity => row[31].to_i,
                             :standard_sharpen_time => row[34].to_i || 0,
                             :sharpen_device_id => shd ? shd.id : nil
                            )
        at.save
        end
      end if file
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
