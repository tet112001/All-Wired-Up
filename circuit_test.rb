require 'test/unit'
require_relative 'circuit_logic'

include CircuitLogic

class TestCircuit < Test::Unit::TestCase
  def test_parse_lines
    s = 'O-----------@'
    assert_equal [s], Circuit.new(s).parse_lines(s)
  end

  def test_bulbline
    circuit = <<CIRCUIT
0-------------|
              |
              O-----------@
1-------------|
CIRCUIT

    assert_equal 2, Circuit.new(circuit).bulb_line
  end
end
