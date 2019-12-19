goal = {
  "Theo" => {
    :color => ["purple", "grey"],
    :gender => ["male"],
    :lives => ["Subway"]
  },
  "Peter Jr." => {
    :color => ["purple", "grey"],
    :gender => ["male"],
    :lives => ["Library"]
  },
  "Lucky" => {
    :color => ["purple"],
    :gender => ["male"],
    :lives => ["Central Park"]
  },
  "Ms .K" => {
    :color => ["grey", "white"],
    :gender => ["female"],
    :lives => ["Central Park"]
  },
  "Queenie" => {
    :color => ["white", "brown"],
    :gender => ["female"],
    :lives => ["Subway"]
  },
  "Andrew" => {
    :color => ["white"],
    :gender => ["male"],
    :lives => ["City Hall"]
  },
  "Alex" => {
    :color => ["white", "brown"],
    :gender => ["male"],
    :lives => ["Central Park"]
  }
}

pigeon_data = {
        :color => {
          :purple => ["Theo", "Peter Jr.", "Lucky"],
          :grey => ["Theo", "Peter Jr.", "Ms. K"],
          :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
          :brown => ["Queenie", "Alex"]
        },
        :gender => {
          :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
          :female => ["Queenie", "Ms. K"]
        },
        :lives => {
          "Subway" => ["Theo", "Queenie"],
          "Central Park" => ["Alex", "Ms. K", "Lucky"],
          "Library" => ["Peter Jr."],
          "City Hall" => ["Andrew"]
        }
      }



#==============================================

def get_pigeon_names(birds_hash)
  names_array = [] #create a new array to hold the birds' names
  birds_hash.each do |key, value| #iterate through the parent hash
    puts "iterando pelo parent hash. a key é #{key} e o value é #{value}"
    birds_hash[key].each do |key2, value2| #iterate through the hash within
      #add into the array the bird name inside this hash
      value2.length.times do |index|
        names_array.push(value2[index])
      end
    end
  end
  names_array.uniq! #drop all duplicated names 
  returned_hash = {} #create a new hash to return 
  
  #iterate through the array and create a new hash with the names to return
  names_array.length.times do |index| 
    returned_hash[names_array[index]] = {}
  end
  returned_hash
end 

return_hash = get_pigeon_names(pigeon_data)

return_hash.each_key do |bird_name| #iterate through the birds' names
  puts "o nome do passaro é #{bird_name}"
  pigeon_data.each do |key, value| #iterate the original data 
    puts "dentro do data. A key é #{key} e o value é #{value}"
    
    #add the characteristic to the bird's hash 
    return_hash[bird_name][key] = []
    
    pigeon_data[key].each do |caracteristic_key, caracteristic_value|
      puts "a key dentro da caracteristica é #{caracteristic_key}"
      puts "o value dentro da caracteristica é #{caracteristic_value}"
      caracteristic_value.length.times do |index|
        if caracteristic_value[index] == bird_name
          puts "\n\n\n"
          puts "é igual #{caracteristic_value[index]} e #{bird_name}"
          puts "então adicione #{caracteristic_key} ao passaro #{bird_name} na caracteristica #{key}"
          p caracteristic_key
          if caracteristic_key.instance_of? String
            return_hash[bird_name][key].push(caracteristic_key)
          else
            return_hash[bird_name][key].push(caracteristic_key.to_s)
          end
          puts caracteristic_key.instance_of? String
          puts "\n\n\n"
        end 
      end
    end
  end 
end

pp return_hash
