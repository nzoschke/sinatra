worker_processes 2
working_directory "."

timeout 30

listen ENV["PORT"]
