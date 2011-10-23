# config/initializers/mailer.rb
ActionMailer::Base.delivery_method = :smtp
 
ActionMailer::Base.smtp_settings = {
#:enable_starttls_auto => true,
:tls => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => "gmail.com",
:user_name => 'd17test2@gmail.com',
:password => 'dirkdk90',
:authentication => 'plain'
}