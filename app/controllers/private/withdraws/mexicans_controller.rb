module Private
  module Withdraws
    class MexicansController < ::Private::Withdraws::BaseController
      include ::Withdraws::Withdrawable
    end
  end
end
