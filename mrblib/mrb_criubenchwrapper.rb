def __main__(argv)
  Syslog.open("haconiwa.criu-wrapper")
  Syslog.info("CRIU is booting via criu-wrapper")

  bin = nil
  %w[/usr/local/sbin/criu /usr/local/bin/criu /usr/sbin/criu /usr/bin/criu].each do |binpath|
    if File.exist?(binpath) && File.readlink("/proc/self/exe") != binpath
      bin = binpath
    end
  end
  bin = ENV['CRIU_BIN_PATH'] if ENV['CRIU_BIN_PATH']

  loop = FiberedWorker::MainLoop.new

  main = Process.fork do
    Exec.execv bin, *argv
  end
  tpid = Process.fork do
    # customize me
    system "timeout -s INT 2s strace -c -f -p #{main} -o /tmp/strace.#{$$}.log"
  end

  Syslog.info "Main is: #{main}"
  loop.pids = [main, tpid]
  loop.on_worker_exit do |status, rest|
    Syslog.info "Termed process! #{status.inspect} rest: #{rest.inspect}"
  end
  ret = loop.run

  Syslog.info("Finished: #{ret.inspect}")
  Syslog.info("Performance log is: /tmp/strace.#{$$}.log")
  Syslog.close
end
