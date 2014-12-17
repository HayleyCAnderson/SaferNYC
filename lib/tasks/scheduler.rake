desc "This task is called by the Heroku scheduler add-on"
task :update_data => :environment do
  puts "Updating data..."
  NypdCollisionData.new.get_incidents
  puts "Data updated."
end
