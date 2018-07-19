require 'gmail'
require 'dotenv'


class Mailer
  def initialize
    gmail = Gmail.connect(USERNAME_GMAIL, PASSWORD_GMAIL)
  end




end
