$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'expressions/add'
require 'expressions/multiply'
require 'statements/do_nothing'
require 'statements/assign'
require 'types/variable'
require 'types/number'
require 'machine/machine'

statement = Assign.new(
  :y,
  Multiply.new(
    Add.new(
      Number.new(10),
      Variable.new(:x)
    ),
    Number.new(15)
  )
)

environment = { x: Number.new(4) }

Machine.new(statement, environment).run
