require 'launchy'



def get_user_email
  puts "Input your email"
  user_email = gets.chomp
  User.find_by_email(user_email)
end

def get_user_choice
  puts "What do you want to do?"
  puts "0. Create shortened URL"
  puts "1. Visit shortened URL"
  gets.chomp
end

def make_url(current_user)
  puts "Type in your long url"
  long_url = gets.chomp
  url = ShortenedUrl.random_code
  ShortenedUrl.create!(submitter_id: current_user.id, long_url: long_url, short_url: url)
  puts "Short url is #{url}"
end

def visit_url(current_user)
  puts "Type in the shortened url"
  given_url = gets.chomp
  short_url = ShortenedUrl.find_by_short_url(given_url)
  Visit.create!(user_id: current_user.id, shortened_url_id: short_url.id)
  puts "Long url is #{short_url.long_url}"
end

def run_url_shortener
  current_user = get_user_email

  choice = get_user_choice
  case choice
    when "0"
      make_url(current_user)
    when "1"
      visit_url(current_user)
  end
end






if __FILE__ == $PROGRAM_NAME
  run_url_shortener
end
