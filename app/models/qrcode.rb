class Qrcode < Archive
  has_attached_file :archive,
                    :url => "/tmp/qrcodes/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/tmp/qrcodes/:id/:style/:basename.:extension"
  attr_accessible :archive_file_name, :archive_content_type, :archive_file_size, :archive_updated_at, :archivable_id, :archivable_type
end
