FROM erlang:latest

COPY _build/default/rel/simple_server/simple_server-0.1.tar.gz /simple_server-0.1.tar.gz
RUN mkdir /simple_server && tar -xf /simple_server-0.1.tar.gz -C /simple_server

EXPOSE 8080

WORKDIR /simple_server

CMD /bin/sh bin/simple_server foreground  
