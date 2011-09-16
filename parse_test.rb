require 'test/unit'
require_relative 'circuit_logic'

include CircuitLogic

class TestCircuitLogic < Test::Unit::TestCase

  def test_or
    circuit = <<CIRCUIT
0-------------|
              |
              O-----------@
1-------------|
CIRCUIT

    assert do_it(circuit)
  end

  def test_and_not
    circuit = <<CIRCUIT 
0-------------|
              A------------|
1-------------|            |
                           X------------@
1-------------|            |
              N------------|
CIRCUIT
    refute do_it(circuit)
  end

  def test_not
    circuit = <<CIRCUIT
0-------------|            
              N------------@
CIRCUIT
    assert do_it(circuit)
  end

  def test_or_xor_xor
    circuit = <<CIRCUIT
0-------------|
              O------------|
1-------------|            |
                           X------------@
1-------------|            |
              X------------|
1-------------|
CIRCUIT
    assert do_it(circuit)
  end
  def test_or_xor_or
    circuit = <<CIRCUIT
1-------------|
              A------------|
1-------------|            |
                           X------------@
1-------------|            |
              X------------|
0-------------|
CIRCUIT
    refute do_it(circuit)
  end

end

