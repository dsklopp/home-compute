def whyrun_supported?
   true
end


action :install do
   if @current_resource.exists
      Chef::Log.info "#{new_resource} already exists - nothing to do."
   else
      converge_by("Install #{ @new_resource }") do
         install_mac_package
      end
   end
end

def install_mac_package
   new_resource
   remote_file "#{new_resource.dest}" do
      source new_resource.url
      checksum new_resource.checksum
      mode '0644'
      notifies :run, "execute[Mount #{new_resource.dest}]", :immediately
   end
   execute "Mount #{new_resource.dest}" do
      command "hdiutil attach #{new_resource.dest} > #{new_resource.dest}.log"
      action :nothing
      notifies :run, "script[Install #{new_resource.dest}]", :immediately
   end 
   script "Install #{new_resource.dest}" do
      interpreter "bash"
      code <<-EOH
         adir=`cat #{new_resource.dest}.log|tail -1|awk -F'\t' '{print $3}'`
         cd "$adir"
         ls *.pkg &> /dev/null
         pkg_exists=$?
         ls *.app &> /dev/null
         app_exists=$?
         if [ ${pkg_exists} -eq 0 ]; then
            installer -package *.pkg -target /
         elif [ ${app_exists} -eq 0 ]; then
            cp -rp *.app /Applications/
         else
            echo "Neither app nor pkg found in #{new_resource.url}" 1>&2
            exit 1
         fi
      EOH
      action :nothing
      notifies :run, "execute[Unmount #{new_resource.dest}]", :immediately
   end
   execute "Unmount #{new_resource.dest}" do
      command "adir=`cat #{new_resource.dest}.log|tail -1|awk -F'\t' '{print $3}'`; hdiutil detach \"$adir\""
      action :nothing
   end
end

def load_current_resource
   @current_resource = Chef::Resource::HomeComputeMacInstall.new(@new_resource.dest)
   @current_resource.dest(@new_resource.dest)
   @current_resource.checksum(@new_resource.checksum)
   @current_resource.url(@new_resource.url)

   #if package_exists?(@current_resource.dest)
      #@current_resource.exists = true
      @current_resource.exists = false
   #end
end


