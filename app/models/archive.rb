class Archive < ActiveRecord::Base
  belongs_to :archivable, :polymorphic => true
  has_attached_file :archive
  attr_accessible :type, :archive_file_name, :archive_content_type, :archive_file_size, :archive_updated_at, :archivable_id, :archivable_type
end
