desc "Imports TV program rss"
task :schedule_7 => :environment do
  Rake::Task['import'].invoke
  Rake::Task['send_programs_mail'].invoke if Time.zone.now.tuesday?
end
task :schedule_19 => :environment do
  Rake::Task['send_programs_mail'].invoke if Time.zone.now.friday?
end
