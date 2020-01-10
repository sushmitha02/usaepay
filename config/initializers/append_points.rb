Workarea::Plugin.append_partials(
  'storefront.cart_checkout_actions',
  'workarea/storefront/carts/usa_epay_checkout'
)

Workarea::Plugin.append_partials(
  'storefront.payment_error',
  'workarea/storefront/checkouts/usa_epay_error'
)

Workarea::Plugin.append_partials(
  'storefront.payment_method',
  'workarea/storefront/checkouts/usa_epay_payment'
)

Workarea::Plugin.append_javascripts(
  'storefront.modules',
  'workarea/storefront/usa_epay/modules/update_checkout_submit_text'
)