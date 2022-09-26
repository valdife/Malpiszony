class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:gmail_credentials, :user_name)
  layout "mailer"
end
