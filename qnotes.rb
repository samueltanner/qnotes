#!/usr/bin/env ruby

input_array = ARGV

if input_array[0] == "new"
  File.open("/users/samtanner/qnotes/qnotes.txt", "a") do |f|
    input = input_array.drop(1)
    f.puts "#{Time.now.strftime("%m/%d/%y")}:  #{input.join(" ")}"
  end
end

if ARGV[0] == "show"
  num = 1
  File.open("/users/samtanner/qnotes/qnotes.txt", "r") do |file_line|
    while line = file_line.gets
      puts "#{num}. #{line}"
      num += 1
    end
  end
end

if ARGV[0] == "delete"
  delete_position = ARGV[1].to_i
  File.open("/users/samtanner/qnotes/qnotes.txt", "r") do |file|
    array = file.map { |line| line.chomp }
    array.delete_at(delete_position - 1)
    array
    File.open("/users/samtanner/qnotes/qnotes.txt", "w+") do |f|
      f.puts array
    end
  end
end
