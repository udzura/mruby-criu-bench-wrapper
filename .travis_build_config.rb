MRuby::Build.new do |conf|
  toolchain :gcc
  conf.gembox 'default'
  conf.gem File.expand_path(File.dirname(__FILE__))
  conf.enable_test

  conf.enable_debug
  # if ENV['DEBUG'] == 'true'
  #   conf.cc.defines = %w(MRB_ENABLE_DEBUG_HOOK)
  #   conf.gem core: 'mruby-bin-debugger'
  # end
end
