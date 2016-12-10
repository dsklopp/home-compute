actions :install
default_action :install

attribute :url, :kind_of => String, :required => true
attribute :dest, :kind_of => String, :name_attribute => true, :required => true
attribute :checksum, :kind_of => String


attr_accessor :exists
