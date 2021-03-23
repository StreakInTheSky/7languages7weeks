class Grepper
  attr_accessor :phrase

  def initialize(phrase)
    @phrase = Regexp.new(phrase)
  end
  def grep(filename)
    lines = File.readlines(filename, :chomp => true)
    lines.each_index do |i|
      puts "#{i+1} #{lines[i]}" if lines[i].match?(@phrase)
    end
  end
end

Grepper.new(/matz/i).grep('file.txt')

