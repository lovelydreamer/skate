# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

# The test environment is used exclusively to run your application's
# test suite. You never need to work with it otherwise. Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs. Don't rely on the data there!

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = false
  config.action_view.cache_template_loading = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Store uploaded files on the local file system in a temporary directory.
  config.active_storage.service = :test

  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true
  SecureHeaders::Configuration.default do |config|
    # Add "; preload" and submit the site to hstspreload.org for best protection.
    config.x_frame_options = 'DENY'
    config.x_content_type_options = 'nosniff'
    config.x_xss_protection = '1; mode=block'
    config.x_download_options = 'noopen'
    config.x_permitted_cross_domain_policies = 'none'
    config.referrer_policy = %w[origin-when-cross-origin strict-origin-when-cross-origin]
    config.csp = {
      # "meta" values. these will shape the header, but the values are not included in the header.
      preserve_schemes: true, # default: false. Schemes are removed from host sources to save bytes and discourage mixed content.
      disable_nonce_backwards_compatibility: true, # default: false. If false, `unsafe-inline` will be added automatically when using nonces. If true, it won't. See #403 for why you'd want this.

      # directive values: these values will directly translate into source directives
      default_src: %w[self],
      base_uri: %w[self],
      block_all_mixed_content: true, # see https://www.w3.org/TR/mixed-content/
      child_src: %w[self], # if child-src isn't supported, the value for frame-src will be set.
      font_src: %w[https://cdn.jsdelivr.net https://jprymo.com self data:],
      form_action: %w[self github.com],
      frame_ancestors: %w[none],
      img_src: %w[cdn.shopify.com self],
      manifest_src: %w[self],
      object_src: %w[self],
      script_src: %w[https://unpkg.com https://cdn.jsdelivr.net https://js.stripe.com self],
      style_src: %w[https://unpkg.com https://cdn.jsdelivr.net self unsafe-inline]
    }
  end
end
