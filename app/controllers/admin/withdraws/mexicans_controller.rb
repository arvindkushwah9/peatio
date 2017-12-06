module Admin
  module Withdraws
    class MexicansController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Mexican'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_mexicans = @mexicans.with_aasm_state(:accepted).order("id DESC")
        @all_mexicans = @mexicans.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @mexican.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @mexican.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
