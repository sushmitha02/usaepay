require 'workarea'
require 'workarea/storefront'
require 'workarea/admin'

require 'workarea/usaepay/engine'
require 'workarea/usaepay/version'

require 'workarea/usaepay/bogus_gateway'
require 'workarea/usaepay/gateway'
require 'workarea/usaepay/response'


require "faraday"

module Workarea
  module UsaEpay
    def self.gateway
      Workarea.config.gateways.usa_epay
    end

    def self.gateway=(gateway)
      Workarea.config.gateways.usa_epay = gateway
    end

    def self.auto_configure_gateway
      if Rails.application.secrets.usa_epay.present?
        self.gateway = ActiveMerchant::Billing::UsaEpayExpressGateway.new(
          Rails.application.secrets.usa_epay.deep_symbolize_keys
        )
      elsif gateway.blank?
        self.gateway = ActiveMerchant::Billing::BogusGateway.new
      end

      if ENV['HTTP_PROXY'].present? && gateway.present?
        parsed = URI.parse(ENV['HTTP_PROXY'])
        gateway.proxy_address = parsed.host
        gateway.proxy_port = parsed.port
      end
    end
  end
end