# XXX: Fix class name
class MockClass
  include Quality::Tools::Pep8
  include Quality::Tools::Jscs
  def initialize(lines)
    @lines = lines
  end

  attr_accessor :sum, :lines

  def python_files
    []
  end

  def js_files_arr
    []
  end

  def ratchet_quality_cmd(name,
                          options,
                          &block)
    @sum = 0
    lines.each do |line|
      @sum += block.call(line)
    end
  end

  def run(tool_name)
    method("quality_#{tool_name}").call
    sum
  end
end
