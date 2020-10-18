# frozen_string_literal: true

if Rails.env.development?
  LetterOpener.configure do |config|
    config.location = Rails.root.join('tmp', 'my_mails')

    config.message_template = :light
  end
end
