# Git and related tools
class ildev::ruby inherits ildev {

  package { [ 'ruby-dev', ]: }

  package { [
        'listen',  # latest version to stop waning message on Sass
                    # (https://github.com/guard/listen/wiki/Getting-the-polling-fallback-message%3F)
        'sass',
    ]:
    provider => 'gem',
    require  => Package['ruby-dev']
  }

}
