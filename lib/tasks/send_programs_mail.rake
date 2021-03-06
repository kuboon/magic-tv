desc "sends mail to available emails"
task :send_programs_mail => :environment do
  puts "Sending mail..."
  User.where(email_active: true).find_each do |user|
    UserMailer.programs(user).deliver
  end
  puts "done."
end
