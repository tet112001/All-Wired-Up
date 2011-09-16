module CircuitLogic
  def const_false
  'false'
  end

  def const_true
  'true'
  end

  def const_or
  '||'
  end
  def const_and
  '&&'
  end
  def const_not
  '!'
  end
  def const_xor
  '^'
  end

  class Gate
    attr_accessor :inputs, :type
    def initialize()
      @inputs = []
    end
    def value
      if @type == '!'
        s = "!#{@inputs[0]}"
        eval s
      else
        s = "#{@inputs[0]} #{@type} #{@inputs[1]}"
        eval s
      end
    end
    def complete
      if @type == '!'
        return @inputs.size == 1
      else
        return @inputs.size == 2
      end
    end
  end

  def do_it(circuit)
    gates = []
    circuit.each_line do |line|
      line.strip!
      @gate = Gate.new if @gate.nil? || @gate.complete
      gates << @gate

      @gate.inputs << 'false' if (line.index('0') == 0)
      @gate.inputs << 'true' if (line.index('1') == 0)

      @gate.type = '||' if (line.index('O') == 0)
      @gate.type = '&&' if (line.index('A') == 0)
      @gate.type = '!'  if (line.index('N') == 0)
      @gate.type = '^' if (line.index('X') == 0)
    end
    gates.first.value
  end
end
