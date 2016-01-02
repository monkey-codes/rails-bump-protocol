module API
  module V1
    class BumpEventsController < ApplicationController

      def show
        event = BumpEvent.find(params[:id])
        render json: event, status: 200

      end

      def create
        bump_event = BumpEvent.new
        bump_event.device_id = bump_event_params[:device_id]
        bump_event.lonlat = RGeo::GeoJSON.decode(bump_event_params[:lonlat], json_parser: :json)

        if bump_event.save
          (1..10).each do
            sleep 1
            bump_event.link_to_nearby_bumps
          end
          render json: bump_event.to_json(include: {matched_events: {only: [:id, :device_id]}}),
            status: 201, location: api_v1_bump_event_url(bump_event[:id])
        end

      end

      private


      def bump_event_params
        params.require(:bump_event).permit(:device_id, lonlat: [:type, coordinates: []])
      end

    end
  end
end
