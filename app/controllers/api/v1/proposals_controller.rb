module Api
  module V1
    class ProposalsController < ApplicationController
      before_action :authenticate_user!

      def index
        if params[:user_id]
          @proposals = Proposal.where(user_id: params[:user_id])
        else
          @proposals = Proposal.all
        end
        render json: @proposals
      end
    end
  end
end
