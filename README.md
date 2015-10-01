Wuaki
=====

##Install that repository

```bash
git clone git@bitbucket.org:benja83/wuaki.git

bundle install

rake db:create

rake db:setup
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

