namespace :bushido do

  desc "Bushido install"
  task :install => :environment do
    setting = Setting.find_or_create_by_slug("sidebar_description")
  end

  

end
