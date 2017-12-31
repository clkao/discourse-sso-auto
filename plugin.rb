# name: discourse-sso-auto
# version: 0.1
# authors: Chia-liang Kao

enabled_site_setting :sso_auto_enabled

#load File.expand_path('../lib/discourse_tooltips/engine.rb', __FILE__)

after_initialize do
end

=begin

# right now we need to change controllers/session_controller#sso_dry
# and add the sso_dry route, which should be registered by the plugin.

# ideally we want to override the sso method and check for param[:dry],
# if it exists we should append the final redirect url with dry_return=

  def sso_dry
    destination_url = cookies[:destination_url] || session[:destination_url]
    return_path = params[:return_path] || path('/')

    if destination_url && return_path == path('/')
      uri = URI::parse(destination_url)
      return_path = "#{uri.path}#{uri.query ? "?" << uri.query : ""}"
    end

    session.delete(:destination_url)
    cookies.delete(:destination_url)

    if SiteSetting.enable_sso?
      sso = DiscourseSingleSignOn.generate_sso(return_path)
      if SiteSetting.verbose_sso_logging
        Rails.logger.warn("Verbose SSO log: Started Dry SSO process\n\n#{sso.diagnostics}")
      end
      redirect_to "#{sso.to_url}&dry_return=#{return_path}"
    else
      render body: nil, status: 404
    end
  end

=end
