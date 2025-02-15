require 'pry'
# MTA Lab
# Objectives:
# Apply your knowledge of Ruby to solve a real world problem.
# Get really good at array manipulation.
# Activity
# Create a program that models a simple subway system.
# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the journey and the total number of stops for the trip in the console:
# planTrip('N', 'Times Square', '6', '33rd'); // This is only a suggested function name and signature.
# // console.log() shows output similar to this:
# // "Your must travel through the following stops on the N line: 34th, 28th, 23rd, Union Square."
# // "Change at Union Square."
# // "Your journey continues through the following stops: 23rd, 28th, 33rd."
# // "7 stops in total."
# There are 3 subway lines:
all_lines = [ 
  {"The N Line" => {:stops => "Times Square, 34th, 28th, 23rd, Union Square, 8th".split(', '), :val => 0}}, 
  {"The L Line" => {:stops => "8th, 6th, Union Square, 3rd, 1st".split(', '), :val => 1}}, 
  {"The 6 Line" => {:stops => "Grand Central, 33rd, 28th, 23rd, Union Square, Astor Place".split(', '), :val => 2}} 
]
# All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)
# Tell the user the number of stops AND the stops IN ORDER that they will pass through or change at.
# Hints:

def plan_trip(start, stop)
  start_l = find_line(start)
  stop_l = find_line(stop)
  if line1 == line2
    puts "You travel along these stops: "
    p travel(line1[:stops], find_index(line1, start), find_index(line1, stop))
  else
    puts "You travel along these stops:"
    p travel(line1[:stops], find_index(line1, start), find_index(line1, "Union Square"))
    puts "changing at Union Square you continue along:"
    p travel(line2[:stops], find_index(line2, "Union Square"), find_index(line2, stop))
  end
end

def find_line(stop)
  container = []
  all_lines.each do |hash|
    if hash.values[0][:stops].includes? stop
      container << hash[:keys][0]
    end
  end
  if container.length > 1
    p "Which line are you starting/stopping at?: "
    name = gets.chomp
  else
    name = container[0]
end

def find_index(line, stop)
  line[:stops].index(stop)
end

def travel(line_stops, index1, index2)
  if index1 < index2
    line_stops[index1..index2]
  else
    line_stops[index2..index1].reverse
  end
end
#travel(n_line[:stops], 4, 0)

plan_trip('Times Square', '34th')
plan_trip('Grand Central','Astor Place')
plan_trip('6th', 'Astor Place')
plan_trip('6th', 'Union Place')


binding.pry
# Work out how you would do it on paper first! Then start to explain that process in Ruby.
# Get the program to work for a single line before trying to tackle multiple lines.
# Don't worry about prompting the user for input. Hard code some values to get it working. You can use prompt() later to make it more interactive.
# Consider diagramming the lines by sketching out the subway lines and their stops and intersection.
# The key to the lab is finding the index positions of each stop. (hint: indexOf())
# Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)