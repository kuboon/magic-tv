desc "Imports TV program rss"
task :import => :environment do
  puts "Importing feed..."
  Program.import
  puts "done."
end
