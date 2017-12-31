import { withPluginApi } from 'discourse/lib/plugin-api';

export default {
  name: 'sso-auto',

  initialize() {
    withPluginApi('0.8.9', api => {
      if (Discourse.SiteSettings.enable_sso && !api.getCurrentUser()) {
        const {referrer, location} = document;
        const now = (new Date()).getTime();
        if (+$.cookie('sso-auto') < now - 300 * 1000) {
          $.cookie('sso-auto', now);
          document.location = '/session/sso_dry?return_path=' + location.toString();
        }
      }
    });
  }
};
