module Private
  module Deposits
    class MexicansController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
