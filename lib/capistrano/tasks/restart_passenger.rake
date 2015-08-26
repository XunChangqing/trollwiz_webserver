#desc "start passenger"
#task :passenger_start do
  #on roles(:all) do |host|
    #execute "cd #{deploy_to}; sudo passenger start current --pid-file shared/config/passenger.pid --log-file shared/config/passenger.log"
  #end
#end

#desc "stop passenger"
#task :passenger_stop do
  #on roles(:all) do |host|
    #execute "cd #{deploy_to}; passenger stop current --pid-file shared/config/passenger.pid --log-file shared/config/passenger.log"
  #end
#end
