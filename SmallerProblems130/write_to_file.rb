def do_this
  file = File.open('empty_file.txt', 'w')
  file.write("Hello there")
  file.close
end

do_this
