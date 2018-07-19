require 'gmail'
require 'dotenv'


class Mailer
  def initialize
    gmail = Gmail.connect(USERNAME_GMAIL, PASSWORD_GMAIL)
  end

  def send_mail
    gmail.deliver do
      to "email@example.com"
      subject "Having fun in Puerto Rico!"
      text_part do
        body "Text of plaintext message."
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "<p>Text of <em>html</em> message.</p>"
      end
      add_file "/path/to/some_image.jpg"
    end
  end
  
end
