#! /usr/bin/ruby

cdn_objects = {
"GOOGLE_CDN_HTTP" => "http://cdn.parolkar.com/images/cat_0.jpg",
"GOOGLE_CDN_HTTPS" => "https://cdn.parolkar.com/images/cat_0.jpg"
}


#Warm Up
cdn_objects.each do |key,value|
  puts "Warming: #{key}"
  cmd = "curl -o /dev/null -s -w \"t_connect=%{time_connect} : st_transfer=%{time_starttransfer}: total=%{time_total}\" \"#{value}\""
  puts `#{cmd}`
end

no_of_trials = 5

#perform the test
cdn_objects.each do |key,value|
  puts "\n\nTesting: #{key}"
  resp_times = []
  no_of_trials.times {
    cmd = "curl -o /dev/null -s -w \"%{time_total}\" \"#{value}\""
    resp_t =  `#{cmd}`
    resp_t = resp_t.to_f
    resp_times << resp_t
  }
  puts "resp times : #{resp_times.join(",")}"
  puts "average : #{resp_times.inject{|sum,x| sum + x } / resp_times.size.to_f}"

end




