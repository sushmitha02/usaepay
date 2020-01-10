module Workarea
  module UsaEpay
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::UsaEpay
    end
  end
end
