#! /Users/Jacob/.rvm/rubies/ruby-1.9.3-p448/bin/ruby

# Convert from ASM80.com hex format to KIM-1 paper tape format

lines=[]
$stdin.each_line {|line| lines << line}

record_count=0

# Handle regular lines
lines[0..-2].each do |line|
  arr=line[1..-1].scan(/../) # Split into bytes - don't include ';'
  arr.slice!(-1)  # Remove checksum
  arr.slice!(3) # Remove the extra '00' from ASM80 format
  chksum=0x0
  arr.each {|byt| chksum+=byt.hex}

  puts ";#{arr.join}#{chksum.to_s(16).upcase.rjust(4,'0')}\n"
  record_count+=1
end

# Handle second last line with the ending string
arr=['00', record_count.to_s(16).upcase.rjust(4,'0')]
chksum=0x0
arr.each {|byt| chksum+=byt.hex}

puts ";#{arr.join}#{chksum.to_s(16).upcase.rjust(4,'0')}\n"

