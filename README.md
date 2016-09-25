Cached API
===========

##Install that repository

```bash
git clone git@github.com:benja83/cached_api.git

bundle install

rake db:create

rake db:setup
```

##Requirement

For caching, you need to have install Memcache

in mac Os X

```bash
brew install memcached
ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
```

##To check the features done in this repo

```bash
rake spec
```

##End points aviable

```bash
                  Prefix Verb URI Pattern                                      Controller#Action
api_v1_content_purchases POST /api/v1/contents/:content_id/purchases(.:format) api/v1/purchases#create {:format=>:json}
         api_v1_contents GET  /api/v1/contents(.:format)                       api/v1/contents#index {:format=>:json}
           api_v1_movies GET  /api/v1/movies(.:format)                         api/v1/movies#index {:format=>:json}
          api_v1_seasons GET  /api/v1/seasons(.:format)                        api/v1/seasons#index {:format=>:json}
    api_v1_library_index GET  /api/v1/library(.:format)                        api/v1/library#index {:format=>:json}
```

