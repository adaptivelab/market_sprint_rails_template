# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: "_#{Rails.application.class.parent.to_s.underscore}_session"
