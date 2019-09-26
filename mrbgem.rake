MRuby::Gem::Specification.new('mruby-criu-bench-wrapper') do |spec|
  spec.bins    = ['criu']

  spec.add_dependency 'mruby-io', core: 'mruby-io'
  spec.add_dependency 'mruby-socket', mgem: 'mruby-socket'
  spec.add_dependency 'mruby-metaprog', core: 'mruby-metaprog'
  spec.add_dependency 'mruby-env', mgem: 'mruby-env'
  spec.add_dependency 'mruby-exec', github: 'haconiwa/mruby-exec'
  spec.add_dependency 'mruby-fibered_worker', github: 'udzura/mruby-fibered_worker'
  spec.add_dependency 'mruby-syslog', github: 'udzura/mruby-syslog'

  spec.license = 'MIT'
  spec.authors = 'Uchio Kondo'
  spec.summary = 'mruby cli utility'
  spec.version = "0.0.1-" + `git rev-parse HEAD`[0..7]
end
