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
  class Circuit
    def initialize(circuit)
      @lines = parse_lines(circuit)
      @special = %w[O A X N 0 1]
    end
    def parse_lines(circuit)
      lines = []
      circuit.each_line do |line|
        lines << line.strip
      end
      lines
    end
    def bulb_line 
      @lines.index{|l| l[-1] == '@'}
    end
    def find_next_node(line)

    end

    def solve
      bulb_index = bulb_line
      ch = ''
      elem = @lines[bulb_index].reverse.each_char do |c|
       ch = c if @special.include?(c)
       break if ch
      end
    end
  end
  def do_it(circuit)
    Circuit.new(circuit).solve
  end
end
