module Workarea
  class Payment
    class Capture
      class UsaEpay
        include OperationImplementation
        include CreditCardOperation

        delegate :gateway, to: Workarea::UsaEpay

        def complete!
          validate_reference!

          transaction.response = handle_active_merchant_errors do
            gateway.capture(
              transaction.amount.cents,
              transaction.reference.response.params['transaction_id'],
              currency: transaction.amount.currency
            )
          end
          transaction.response = 
            ActiveMerchant::Billing::Response.new( 
              gateway_response.success?, 
              gateway_response.message
            )
        end

        def cancel!
          return unless transaction.success?

          transaction.cancellation = handle_active_merchant_errors do
            gateway.refund(
              transaction.amount.cents,
              transaction.response.params['transaction_id']
            )
          end
          transaction.cancellation = 
            ActiveMerchant::Billing::Response.new( 
              gateway_cancellation.success?, 
              gateway_cancellation.message
            )
        end
      end
    end
  end
end
