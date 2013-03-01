#
# Capistrano recipe to inspect remote log files.
#

unless Capistrano::Configuration.respond_to?(:instance)
  abort "This extension requires Capistrano 2"
end

Capistrano::Configuration.instance.load do

  # Use this variable to configure the name of the log file to access.
  #
  # This defaults to the Rails environment name.

  unless exists? :log_name
    set(:log_name) { rails_env }
  end

  # The following are tasks to help inspect the log files in the staging and
  # production environments:
  #
  #   # Downloads the log to log/${environment}.log.
  #   bundle exec cap log:download
  #
  #   # Tail-follows the log, stop following via Ctrl-C.
  #   bundle exec cap log:tail
  #

  namespace :log do
    desc "Download remote log files."
    task :download, :roles => :app do
      get "#{shared_path}/log/#{log_name}.log", "log/#{log_name}.log"
    end

    desc "Tail-follow remote log files."
    task :tail, :roles => :app do
      begin
        run "tail -f #{shared_path}/log/#{log_name}.log" do |channel, stream, data|
          if stream == :out
            $stdout.print data
          elsif stream == :err
            $stderr.print data
          end
        end
      rescue Interrupt
        # Intentionally ignored, the user cancels with this interrupt
      end
    end
  end

end
