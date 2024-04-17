class Rack::Attack
  
  # We safe list localhost.
  Rack::Attack.safelist( 'allow from localhost' ) do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  # We build an array of Cloudflare IPs taken from [the Cloudflare IP range page](https://www.cloudflare.com/en-gb/ips/).
#cloudflare_ips = ['2400:cb00::/32', '2606:4700::/32', '2803:f800::/32', '2405:b500::/32', '2405:8100::/32', '2a06:98c0::/29','2c0f:f248::/32', '173.245.48.0/20', '103.21.244.0/22', '103.22.200.0/22', '103.31.4.0/22','141.101.64.0/18', '108.162.192.0/18', '190.93.240.0/20', '188.114.96.0/20', '197.234.240.0/22', '198.41.128.0/17', '162.158.0.0/15', '104.16.0.0/13', '104.24.0.0/14', '172.64.0.0/13', '131.0.72.0/22']

  # We build an array of Cloudflare IPs taken from [the Cloudflare IP range page](https://www.cloudflare.com/en-gb/ips/).
  cloudflare_ips = ['2400:cb00::', '2606:4700::', '2803:f800::', '2405:b500::', '2405:8100::', '2a06:98c0::','2c0f:f248::', '173.245.48.0', '103.21.244.0', '103.22.200.0', '103.31.4.0','141.101.64.0', '108.162.192.0', '190.93.240.0', '188.114.96.0', '197.234.240.0', '198.41.128.0', '162.158.0.0', '104.16.0.0', '104.24.0.0', '172.64.0.0', '131.0.72.0']

  class Request < ::Rack::Request
    def remote_ip      
      @remote_ip ||= (env['HTTP_CF_CONNECTING_IP'] || env['action_dispatch.remote_ip'] || ip).to_s
    end
  end





Rack::Attack.safelist( 'allow from cloudflare' ) do |request|
  
  puts request.header
  
  puts "==== allowed ===="
  puts request.ip
  if cloudflare_ips.include?( request.ip )
    puts "yup"
  else
    puts "nope"
  end
  
  # If the Cloudflare IPs array includes the request IP, we add it to the allow list.
  cloudflare_ips.include?( request.ip )
end

# We build a list blocking all IPs that are not in the Cloudflare IP array.
Rack::Attack.blocklist( 'block any none cloudflare' ) do |request|
  
  puts "==== blocked ===="
  puts request.ip
  if cloudflare_ips.include?( request.ip )
    puts "nope"
  else
    puts "yup"
  end
  
  # If the Cloudflare IPs array does not include the request IP, we block it.
  !cloudflare_ips.include?( request.ip )
end
end


