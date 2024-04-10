# We safe list localhost.
Rack::Attack.safelist('allow from localhost') do |req|
  '127.0.0.1' == req.ip || '::1' == req.ip
end

# We build an array of Cloudflare IPs taken from [the Cloudflare IP range page](https://www.cloudflare.com/en-gb/ips/).
cloudflare_ips = ['173.245.48.0/20', '103.21.244.0/22', '103.22.200.0/22', '103.31.4.0/22', '141.101.64.0/18', '108.162.192.0/18', '190.93.240.0/20', '188.114.96.0/20', '197.234.240.0/22', '198.41.128.0/17', '162.158.0.0/15', '104.16.0.0/13', '104.24.0.0/14', '172.64.0.0/13', '131.0.72.0/22']

# We build a list blocking all IPs that are not in the Cloudflare IP array.
Rack::Attack.blocklist( 'allow from cloudflare only' ) do |request|
  
  # If the Cloudflare IPs array does not include the request IP, we block it.
  !cloudflare_ips.include?( request.ip )
end