# Public: Set a global git configuration value.
#
# namevar - The String name of the configuration option.
# value   - The String value of the configuration option.
#
# Examples
#
#   git::config::global { 'user.name':
#     value => 'Hugh Bot',
#   }
#
#   git::config::global { 'user.email':
#     value => 'test@example.com',
#   }
define git::config::global($value) {
  $split_key = split($name, '\.')
  $section = join(delete_at($split_key, size($split_key) - 1), '.')
  $setting = $split_key[-1]
  $path = "/Users/${::boxen_user}/.gitconfig"

  ini_setting { "set ${name} to ${value} in ${path}":
    ensure  => present,
    path    => $path,
    section => $section,
    setting => $setting,
    value   => $value,
  }
}
