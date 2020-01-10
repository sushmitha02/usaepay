module Workarea
  class Payment
    class Refund
      class UsaEpay
        include OperationImplementation
        include CreditCardOperation

        def complete!
          validate_reference!

          transaction.response = handle_active_merchant_errors do
            Workarea::UsaEpay.gateway.refund(
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
          # noop
        end
      end
    end
  end
end
