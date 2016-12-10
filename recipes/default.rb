#
# Cookbook Name:: home-compute
# Recipe:: default
#
# Copyright (C) 2016 Dan Klopp
#
# All rights reserved - Do Not Redistribute
#

package "git"
package "wget"

directory "/opt/dl"

home_compute_mac_install "/opt/dl/virtualbox.dmg" do
   url "http://download.virtualbox.org/virtualbox/5.1.10/VirtualBox-5.1.10-112026-OSX.dmg"
   checksum "3500f07be9f5e27a08c00cc626981230bdaf639f6fad0b82ecf731a0580cccef"
end
home_compute_mac_install "/opt/dl/vagrant.dmg" do
   url "https://releases.hashicorp.com/vagrant/1.9.0/vagrant_1.9.0.dmg"
   checksum "896eb09fdd4b35ecb4d7cb02394b0a7b57cda1cb218a4b0d6e0d9340265f8590"
end
home_compute_mac_install "/opt/dl/keepassx.dmg" do
   url "https://www.keepassx.org/releases/2.0.3/KeePassX-2.0.3.dmg"
   checksum "44271fef18fd07a29241e5324be407fa8edce77fb0b55c5646cd238092cdf823"
end
home_compute_mac_install "/opt/dl/sublime.dmg" do
   url "https://download.sublimetext.com/Sublime%20Text%20Build%203126.dmg"
   checksum "2bbd357cd29303b05770ef479e2f86ea8166ac43062ae9e84dc07abfd0ce2c96"
end
home_compute_mac_install "/opt/dl/vlc.dmg" do
   url "http://videolan.mirrors.hivelocity.net/vlc/2.2.4/macosx/vlc-2.2.4.dmg"
   checksum "fd071b9817c9efccac5a144d69893a4a5323cbde4a74d5691c3cf3ab979d4160"
end
home_compute_mac_install "/opt/dl/evernote.dmg" do
   url "https://evernote.com/download/get.php?file=EvernoteMac"
   checksum "ad2ad4d426362f8bc6fff205522365cfe9a5bd5f36369fc6c3c8bd7f9dd4e288"
end
#home_compute_mac_install "/opt/dl/scrivener.dmg" do
#   url "http://scrivener.s3.amazonaws.com/Scrivener.dmg"
#   checksum "752a689ca500a9b5ec8192790fd747671896e4f3ca4c8e14cc0b9943726cc36a"
#end
home_compute_mac_install "/opt/dl/torbrowser.dmg" do
   url "https://www.torproject.org/dist/torbrowser/6.0.7/TorBrowser-6.0.7-osx64_en-US.dmg"
   checksum "59e127188f4090efe45f31318a6117e8c59532f756c2324c0369538b988f5fbd"
end
