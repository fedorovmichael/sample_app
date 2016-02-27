root = '/home/miha/www/sampleapp/current'
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn_error.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.sampleapp.sock"
worker_processes 1
timeout 30
