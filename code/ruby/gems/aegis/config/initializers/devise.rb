# Use this hook to configure devise, and to setup all of your authentication needs.
Devise.setup do |config|
  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (using Devise::Mongoid).
  require 'devise/orm/active_record'

  # Configure the `User` model to be used by Devise.
  # config.authentication_keys = [ :email ]

  # Configure the `User` model to be used by Devise.
  # config.case_insensitive_keys = [ :email ]

  # Configure the `User` model to be used by Devise.
  # config.strip_whitespace_keys = [ :email ]

  # Tell Devise to use the `Aegis::User` model.
  config.scoped_views = true

  # Navigation helpers are Devise::Controllers::Helpers.
  # config.navigational_formats = [ :html ]

  # The default HTTP method used to sign out a resource.
  config.sign_out_via = :delete

  # ==> Configuration for :database_authenticatable
  # For more information on these options, check the documentation of
  # Devise::Models::DatabaseAuthenticatable.
  config.password_length = 6..128

  # ==> Configuration for :confirmable
  # For more information on these options, check the documentation of
  # Devise::Models::Confirmable.
  # config.confirmation_keys = [ :email ]
  # config.reconfirmable = true
  # config.expire_all_remember_me_on_sign_out = true

  # ==> Configuration for :lockable
  # For more information on these options, check the documentation of
  # Devise::Models::Lockable.
  # config.lock_strategy = :failed_attempts
  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour

  # ==> Configuration for :recoverable
  # For more information on these options, check the documentation of
  # Devise::Models::Recoverable.
  # config.reset_password_keys = [ :email ]
  # config.expire_all_remember_me_on_sign_out = true

  # ==> Configuration for :rememberable
  # For more information on these options, check the documentation of
  # Devise::Models::Rememberable.
  # config.remember_for = 2.weeks
  # config.expire_all_remember_me_on_sign_out = true

  # ==> Configuration for :timeoutable
  # For more information on these options, check the documentation of
  # Devise::Models::Timeoutable.
  # config.timeout_in = 30.minutes

  # ==> Configuration for :trackable
  # For more information on these options, check the documentation of
  # Devise::Models::Trackable.
  # config.track_valid_authentication_attempts = true
end
