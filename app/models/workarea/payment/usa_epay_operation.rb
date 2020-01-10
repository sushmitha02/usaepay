module Workarea
  class Payment
    module UsaEpayOperation

      def gateway
        Workarea::UsaEpay.gateway
      end

      def handle_gateway_errors
        begin
          yield
        rescue UsaEpay::Gateway::ConnectionError => error
          UsaEpay::Gateway::Response.new(false, nil)
        end
      end
      
    end
  end
end