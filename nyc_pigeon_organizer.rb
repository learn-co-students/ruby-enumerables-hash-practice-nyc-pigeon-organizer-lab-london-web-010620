require 'pp'

def nyc_pigeon_organizer(data)
  pigeon_list= {}
  data.each do |key,value| #key = color,gender,lives | value = purple,grey,male,female,lives
    value.each do |info, array | # info = purple,male,subway 
      array.each do |name| 
      pigeon_list[name]={:color => [],:gender => [],:lives =>[] } 
      end
    end
  end

  keys = pigeon_list.keys

  data[:color].each do |color,name|
    name.each do |pigeon_name|
      keys.each do |pigeon|
        if pigeon === pigeon_name
          pigeon_list[pigeon][:color] << color.to_s
        end
      end
    end
  end
  data[:gender].each do |malefemale,gender|
    gender.each do |element|
      keys.each do |key|
        if key === element
          pigeon_list[key][:gender] << malefemale.to_s
        end
      end
    end
  end
data[:lives].each do |location,name|
    name.each do |element|
      keys.each do |key|
        if key === element
          pigeon_list[key][:lives] << location.to_s
        end
      end
    end
  end
  pigeon_list
  end
