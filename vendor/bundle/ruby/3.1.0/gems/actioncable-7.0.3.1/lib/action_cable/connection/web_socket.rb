require 'websocket/driver'

module ActionCable
  module Connection
    # Wrap the real socket to minimize the externally-presented API
    class WebSocket # :nodoc:
      def initialize(env, event_target, event_loop, protocols: ActionCable::INTERNAL[:protocols])
        @websocket = if ::WebSocket::Driver.websocket?(env)
                       ClientSocket.new(env, event_target, event_loop,
                                        protocols)
                     end
      end

      def possible?
        websocket
      end

      def alive?
        websocket&.alive?
      end

      def transmit(data)
        websocket.transmit data
      end

      def close
        websocket.close
      end

      def protocol
        websocket.protocol
      end

      def rack_response
        websocket.rack_response
      end

      private

      attr_reader :websocket
    end
  end
end