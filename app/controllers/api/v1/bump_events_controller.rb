module API
  module V1
    class BumpEventsController < ApplicationController

      def show
        event = BumpEvent.find(params[:id])
        render json: event, status: 200

      end

      def create
        bump_event = BumpEvent.create(bump_event_params)
        if bump_event.save
           render json: bump_event, status: 201, location: api_v1_bump_event_url(bump_event[:id])
        end

      end

      private

      def bump_event_params
        params.require(:bump_event).permit(:device_id, :latitude, :longitude)
      end

    end
  end
end
