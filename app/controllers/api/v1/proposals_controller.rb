module Api
  module V1
    class ProposalsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_proposal, only: [ :show, :update, :destroy, :accept, :reject ]

      def index
        if current_user
          @proposals = Proposal.where(user_id: current_user.id, request_id: params[:request_id])
        elsif params[:request_id]
          @proposals = Proposal.where(request_id: params[:request_id])
        else
          @proposals = Proposal.all
        end
        render json: @proposals.as_json(methods: :formatted_price, except: :price), each_serializer: nil
      end

      def show
        render json: @proposal.as_json(methods: :formatted_price), serializer: nil
      end

      def create
        @proposal = current_user.proposals.build(proposal_params.merge!({ status: :pending }))
        if @proposal.save
          render json: @proposal.as_json(methods: :formatted_price), status: :created, serializer: nil
        else
          render json: { errors: @proposal.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @proposal.user_id == current_user.id && @proposal.update(proposal_params)
          render json: @proposal.as_json(methods: :formatted_price), status: :ok, serializer: nil
        else
          render json: { errors: @proposal.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @proposal.user_id == current_user.id
          @proposal.destroy
          head :no_content
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
      end

      def accept
        if @proposal.update(status: :accepted)
          render json: @proposal
        else
          render json: { errors: @proposal.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def reject
        if @proposal.update(status: :rejected)
          render json: @proposal
        else
          render json: { errors: @proposal.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_proposal
        @proposal = Proposal.find(params[:id])
      end

      def proposal_params
        params.expect(proposal: [
          :price,
          :currency,
          :delivery_time_days,
          :warranty_months,
          :notes,
          :request_id
        ])
      end
    end
  end
end
