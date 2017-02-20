# 6.13 all code before connection b/w user and channel is established here, ie: can authenticate users prior to them connecting to the ActionCable server

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # from  6.14
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def disconnect
    end

    protected

      def find_verified_user
        if verified_user = request.env['warden'].user
          verified_user
        else
          reject_unauthorized_connection
        end
      end

  end
end




