require './lib/ruby_tdd'

test_case('second test', Proc.new {
  2 == 2
})

test_case('...and third', Proc.new {
  3 == 3
})