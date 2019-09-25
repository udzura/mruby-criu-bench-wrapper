# mruby-criu-bench-wrapper   [![Build Status](https://travis-ci.org/udzura/mruby-criu-bench-wrapper.svg?branch=master)](https://travis-ci.org/udzura/mruby-criu-bench-wrapper)
CriuBenchWrapper class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'udzura/mruby-criu-bench-wrapper'
end
```
## example
```ruby
p CriuBenchWrapper.hi
#=> "hi!!"
t = CriuBenchWrapper.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
