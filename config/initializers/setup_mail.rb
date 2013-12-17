if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => "app20284552@heroku.com",
    :password       => "4d1szen2",
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end