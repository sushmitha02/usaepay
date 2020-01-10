Workarea::Storefront::Engine.routes.draw do
  get 'usa_epay/start' => 'usa_epay#start', as: :start_usa_epay
  get 'usa_epay/complete/:order_id' => 'usa_epay#complete', as: :complete_usa_epay
  get 'usa_epay/cancel/:order_id' => 'usa_epay#cancel', as: :cancel_usa_epay
end