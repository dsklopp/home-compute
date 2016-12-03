#
# Cookbook Name:: home-compute
# Recipe:: default
#
# Copyright (C) 2016 Dan Klopp
#
# All rights reserved - Do Not Redistribute
#

package "git"
package "virtualbox"
package "vagrant"

file "/tmp/demo.txt" do
  owner node['home-compute']['mac']['user']
  group node['home-compute']['mac']['group']
  mode 0755
end

