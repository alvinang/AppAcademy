require 'csv'
require 'sunlight/congress'
require 'erb'
require 'Date'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"


def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone_number(number)
	number = number.delete(".()-") unless number.nil?
	length = number.length unless number.nil?
	if length == 10
		number
	elsif length == 11
		number.start_with?("1") ? number[1..-1] : "0000000000"
	else
		number = "0000000000"
	end	
	number
end

def day_stats(regdate)    
    unless regdate.nil? 
	    date = Date.strptime(regdate.split(" ").first, "%m/%d/%y") 
	    day = date.wday
	    @days[day.to_i] = @days[day.to_i] + 1
	    days.each_with_index{|counter,day| puts "#{day}\t#{counter}"}
	end
end

def print_hour(time)
	hour = time.split(" ").last.split(":").first unless time.nil?
	hour
end


def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end


def save_thank_you_letters(id, form_letter)
	Dir.mkdir("output") unless Dir.exists? "output"

	filename = "output/thanks_#{id}.html"

	File.open(filename, 'w') do |file|
		file.puts form_letter
	end	
end


puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter
@days = Array.new(7){0}

contents.each do |row|
	id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	phone = clean_phone_number(row[:HomePhone])
	legislators = legislators_by_zipcode(zipcode)

	hour = print_hour(row[:RegDate])
	day_statistics = day_stats(row[:RegDate])
	form_letter = erb_template.result(binding)

	save_thank_you_letters(id, form_letter)
	print hour
	puts day_statistics
end
