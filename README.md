# discourse-sso-auto

(WIP)

This plugin attemps to login user with the configured SSO provider.

## Installation

Follow the [Install a Plugin](https://meta.discourse.org/t/install-a-plugin/19157)
howto, using `git clone https://github.com/clkao/discourse-sso-auto.git`
as the plugin command.

To enable, make sure the `sso auto enabled` site setting is set to true.

## SSO Provider changes

The SSO provider must support an additional `dry_return` param, which means the
provider should immediately redirect to that url if the user is not logged in.
Otherwise proceed with regular provider-side login process.

## Contributing

Help make this plugin better by submitting a PR.  It's as easy as 1-2-3

* fork the repo
* create a feature branch
* rebase off master and send the pr

This project uses MIT-LICENSE.

## Issues

If you have issues or suggestions for the plugin, please bring them up on [Discourse Meta](https://meta.discourse.org).

## License

[MIT](https://clkao.mit-license.org/)
