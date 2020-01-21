
# pigeon_data = {
#   :color => {
#     :purple => ["Theo", "Peter Jr.", "Lucky"],
#     :grey => ["Theo", "Peter Jr.", "Ms. K"],
#     :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
#     :brown => ["Queenie", "Alex"]
#   },
#   :gender => {
#     :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
#     :female => ["Queenie", "Ms. K"]
#   },
#   :lives => {
#     "Subway" => ["Theo", "Queenie"],
#     "Central Park" => ["Alex", "Ms. K", "Lucky"],
#     "Library" => ["Peter Jr."],
#     "City Hall" => ["Andrew"]
#   }
# }



def nyc_pigeon_organizer(pigeon_data)
  
  pigeon_list = {}
  
  pigeon_by_name = pigeon_data[:color]

  array_of_arrays_of_names = pigeon_by_name.each_value.uniq

  array_of_unique_names = array_of_arrays_of_names.flatten.uniq

  array_of_unique_names.each do |name|
    pigeon_list[name] = {:color => [], :gender => [], :lives => []}
  end
  
  pigeon_data[:color].each do |key,value|
    value.each do |pigeon_name|
      pigeon_list.keys.each do |pigeon|
        if pigeon === pigeon_name
          pigeon_list[pigeon][:color] << key.to_s
        end
      end
    end
  end
    
  pigeon_data[:gender].each do |key,value|
      value.each do |pigeon_name|
        pigeon_list.keys.each do |pigeon|
          if pigeon === pigeon_name
            pigeon_list[pigeon][:gender] << key.to_s
          end
        end
      end
  end

  pigeon_data[:lives].each do |key,value|
      value.each do |pigeon_name|
        pigeon_list.keys.each do |pigeon|
          if pigeon === pigeon_name
            pigeon_list[pigeon][:lives] << key.to_s
          end
        end
      end
  end

  pigeon_list
end




