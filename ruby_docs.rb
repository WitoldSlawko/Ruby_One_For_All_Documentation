arr_lines = IO.readlines("ri_sources_to_execute.md")

arr_lines.flatten!

arr_lines.each do |rep|
  rep.sub!(/\n/,'')
end

arr_lines.each do |line|
  puts "mkdir ruby_one_for_all_docs/#{line}"
  puts "ri --format=markdown -a #{line} > ruby_one_for_all_docs/#{line}/README.md"
end
