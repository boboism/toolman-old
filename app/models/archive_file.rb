class ArchiveFile < ActiveRecord::Base
  attr_accessible :file_suffix, :name, :size, :type, :url
end
