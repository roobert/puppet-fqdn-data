#!/usr/bin/env ruby
# encoding=utf-8

require 'socket'

Facter.add('fqdn_data') do
  setcode do
    fqdn = Socket.gethostbyname(Socket.gethostname).first.split('.')

    {
      :location => fqdn[-3],
      :logical_group => fqdn[-4],
    }
  end
end
