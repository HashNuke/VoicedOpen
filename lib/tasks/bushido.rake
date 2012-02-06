namespace :bushido do

  desc "Bushido install"
  task :install => :environment do
    setting = Setting.find_or_create_by_slug("sidebar_description")
    user = User.create :email => "john@example.com", :password => "asdgadjlvbdvb", :first_name => "John", :last_name => "Doe"
    ticket = user.tickets.build :title => "Hello World!", :message => "This is a new ticket"
    ticket.save
  end

  

end
