arr_lines = IO.readlines("ri_sources.md")

arr_lines.flatten!

arr_lines.each do |rep|
  rep.sub!(/\n/,'')
end

#print arr_lines

arr_lines.each do |line|
  puts "mkdir ruby_one_for_all_docs/#{line}"
  puts "ri --format=markdown -a #{line} > ruby_one_for_all_docs/#{line}/README.md"
end

# ri --format=markdown -a line > ofa/line.md