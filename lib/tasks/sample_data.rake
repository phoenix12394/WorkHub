require 'faker'

namespace :db do
  desc "Fill database w sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_locations
    make_microposts
    make_tags
    make_post_content
  end
end


def make_tags
Tag.all.each do |tag|
   User.all.each do |user|
     if (rand(10) == 1)
        user.tags << Tag.find_by_name(tag.name)
      end
    end 
    
    
end 

Tag.all.each do |tag|
   Micropost.all.each do |post|
     if (rand(20) == 1)
        post.tags << Tag.find_by_name(tag.name)
      end
    end 
end
  
end
def make_users
    admin = User.create!(:name => "Admin", :email => "admin@admin.com", :password => "password", :password_confirmation => "password")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Internet.user_name
      email = "example-#{n+1}@watever.com"
      password = "password"
      bio = Faker::Lorem.paragraphs(2)
      User.create!(:name => name, :email => email, :password => password, :password_confirmation => password, :bio => bio)
    end  
end

def make_microposts
  tags = Tag.all
    User.all.each do |user|
      10.times do |n|
        if (rand(3) == 1)
          num = rand(5)
          tag = tags[rand(100)].name
          if num == 0
            title = "Looking someone for " + tag + ", will pay well!"
          end
          if num == 1
            title = tag + " needed ASAP"
          end
          if num == 2
            title = "Can someone do " + tag + "?"
          end
          if num == 3
            title = tag + " wanted"
          end                  
          if num == 4
            title = "I need " + tag + " skills"
          end        
          user.microposts.create!(:title => title, :content => Faker::Lorem.paragraphs(3), :location_id => rand(51), :category_id => rand(31), :compensation => 10 + rand(25))
        end
      end
    
    end  
  end
    
def make_post_content
  Micropost.all.each do |post|
    post.content = "asdkljksldjckljweklcjlkajwckljawekljvklawjklvjawkejcjaklewklckaweacwjecjaklw"
    
    
  end
  
end    
    
def make_locations
    50.times do |n|
      name = Faker::Address.city
      Location.create!(:name => name)
    end   


end
