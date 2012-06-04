class SettingDevice < ActiveRecord::Base
  attr_accessible :description, :name

  def to_str
    "#{name}"
  end
  alias to_label to_str
  alias to_s to_str
end
