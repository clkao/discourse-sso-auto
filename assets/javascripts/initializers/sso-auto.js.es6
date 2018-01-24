import { withPluginApi } from 'discourse/lib/plugin-api';

export default {
  name: 'sso-auto',

  initialize() {
    withPluginApi('0.8.9', api => {
      const {enable_sso, oauth2_enabled} = Discourse.SiteSettings;
      if ( !api.getCurrentUser() && (enable_sso || oauth2_enabled) ) {
        const {referrer, location} = document;
        const now = (new Date()).getTime();
        if (+$.cookie('sso-auto') < now - 300 * 1000) {
          $.cookie('sso-auto', now);
          document.location = (enable_sso ? '/session/sso_dry' : '/auth/oauth2_basic')
            + '?return_path=' + location.toString();
        }
      }
    });
  }
};
