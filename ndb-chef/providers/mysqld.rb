action :start do
  bash "start-#{new_resource.name}" do
    user node['ndb']['user']
    code <<-EOF
    #{node['ndb']['scripts_dir']}/mysql-server-start.sh
  EOF
  end
  new_resource.updated_by_last_action(true)
end

action :stop do
  bash "stop-#{new_resource.name}" do
    user node['ndb']['user']
    code <<-EOF
    #{node['ndb']['scripts_dir']}/mysql-server-stop.sh
  EOF
  end
  new_resource.updated_by_last_action(true)
end

action :restart do
  bash "restart-#{new_resource.name}" do
    user node['ndb']['user']
    code <<-EOF
    #{node['ndb']['scripts_dir']}/mysql-server-restart.sh
  EOF
  end
  new_resource.updated_by_last_action(true)
end
