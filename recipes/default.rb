#
# Cookbook:: mongodb--server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# 





apt_repository "mongodb-org" do
	uri 'http://repo.mongodb.org/apt/ubuntu'
	keyserver "hkp://keyserver.ubuntu.com:80"
  	key "EA312927"
  	distribution "xenial/mongodb-org/3.2"
  	components ["multiverse"]
end

apt_update #apt repository maybe doing it source list

package "mongodb-org" do
	action :upgrade
end



template '/etc/systemd/system/mongodb.service' do
	source 'mongodb.service.erb'
	owner 'root'
	group 'root'
	mode '0755'
end


template '/etc/mongodb.conf' do
	source 'mongodb.conf.erb'
	owner 'root'
	group 'root'
	mode '0755'
end

service 'mongodb' do 
 supports status: true, restart: true, reload: true
 action [:unmask, :enable, :start]
end



# systemd_unit 'mongodb.service' do
	
# 	action [:unmask, :enable]

# end







#~/DevOps/mongo_db/mongodb.service /etc/systemd/system/


#~/DevOps/mongo_db/mongod.conf /etc/ 


