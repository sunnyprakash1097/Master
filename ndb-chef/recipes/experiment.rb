
remote_file "#{node['ndb']['scripts_dir']}/flexAsync" do
  owner node['ndb']['user']
  group node['ndb']['group']
  source "http://snurran.sics.se/hops/flexAsync"
  mode 0755
  action :create
end

template "#{node['ndb']['scripts_dir']}/flexAsyncRun.sh" do
  source "flexAsync.sh.erb"
  owner node['ndb']['user']
  group node['ndb']['group']
  mode 0754
  variables({ :mgmd_ip => node['ndb']['mgmd']['private_ips'][0] })
end
