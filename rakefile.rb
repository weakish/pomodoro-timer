task :install, [:install_prefix] do |t, args|
  args.with_defaults(:install_prefix => '/usr')
  puts "Installing to #{args.install_prefix}"
  sh "chmod 755 pomodoro-timer.sh"
  sh "cp pomodoro-timer.sh #{args.install_prefix}/bin/pomodoro-timer"
end

task :test do |t|
  sh "cd test && bats pomodoro-timer.bats"
  puts "Do not forget to run atq and atrm."
  puts "Otherwise, there will be a lot of notifications!"
end
