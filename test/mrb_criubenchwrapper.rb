##
## CriuBenchWrapper Test
##

assert("CriuBenchWrapper#hello") do
  t = CriuBenchWrapper.new "hello"
  assert_equal("hello", t.hello)
end

assert("CriuBenchWrapper#bye") do
  t = CriuBenchWrapper.new "hello"
  assert_equal("hello bye", t.bye)
end

assert("CriuBenchWrapper.hi") do
  assert_equal("hi!!", CriuBenchWrapper.hi)
end
