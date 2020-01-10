module Workarea
  class Payment
    module Purchase
      class UsaEpay
        include OperationImplementation
        include CreditCardOperation

        delegate :gateway, to: Workarea::UsaEpay

        def complete!
          transaction.response = handle_active_merchant_errors do
            gateway.purchase(
              transaction.amount.cents,
              token: tender.token,
              payer_id: tender.payer_id,
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
            gateway.void(transaction.response.params['transaction_id'])
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
