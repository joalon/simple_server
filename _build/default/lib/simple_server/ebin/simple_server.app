{application,simple_server,
             [{description,"A simple erlang application serving content from Redis."},
              {vsn,"0.0.1"},
              {registered,[]},
              {modules,[simple_server_app,simple_server_sup,views_handler]},
              {applications,[kernel,stdlib,cowboy,eredis]},
              {mod,{simple_server_app,[]}},
              {env,[]}]}.
