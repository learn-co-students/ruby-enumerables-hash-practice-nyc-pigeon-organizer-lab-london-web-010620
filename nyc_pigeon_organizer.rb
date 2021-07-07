require 'pry'

def nyc_pigeon_organizer(data)
  pigeon_list = {}
  data.each do |att, key|
    key.each do |stats, array_names|
      array_names.each do |name|
         pigeon_list[name] ||= {}
        pigeon_list[name][att] ||= []
        pigeon_list[name][att].push(stats.to_s)
      end
    end 
  end
  pigeon_list
end
