hash = {}
arr = ["january", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
arr.each do |t|
  hash[t.size] || = []
  hash[t.size].push t
end

puts hash
