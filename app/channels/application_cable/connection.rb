# 6.13 all code before connection b/w user and channel is established here, ie: can authenticate users prior to them connecting to the ActionCable server

module ApplicationCable
  class Connection < ActionCable::Connection::Base
  end
end
