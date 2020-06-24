vcl 4.0;

backend default {
  .host = "hello-world:80";
}

sub vcl_recv {
  set req.http.X-Full-Uri = req.http.host + req.url;
}

