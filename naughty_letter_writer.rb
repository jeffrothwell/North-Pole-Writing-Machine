require 'erb'
# require 'pry'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  behavior = kid_data_array[1]
  toys     = kid_data_array[2..7]
  infraction = kid.split('|  ')[-1].chomp
  next unless behavior == 'naughty'

  toy_to_give = toys.sample

  # do while toy_to_give == "Kaleidoscope"
  #   toy_to_give = toys.sample
  # end

  toys.delete(toy_to_give)

  filename    = 'letters/naughty/' + name + '.txt'
  # binding.pry
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
