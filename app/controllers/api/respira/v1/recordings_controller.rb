module Api
  module Respira
    module V1
      class RecordingsController < Api::Respira::V1::BaseController
        acts_as_token_authentication_handler_for User, except: %i[index show]
        before_action :set_recording, only: %i[show update]
        
        def index
          @recordings = policy_scope(Recording)
        end

        def show
        end

        def update
          if @recording.update(recording_params)
            render :show
          else
            render_error
          end
        end
        
        def create
          file = File.read('lib/examples/json/example1.json')
          # data_hash = JSON.parse(file)
          
          @recording = Recording.new(recording_params)
          
          @recording.data = file
          
          @recording.user = current_user
          authorize @recording
          if @recording.save
            render :show, status: :created
          else
            render_error
          end
        end

        private

        def set_recording
          @recording = Recording.find(params[:id])
          authorize @recording 
        end

        def recording_params
          params.require(:recording).permit(:data, :description)
        end

        def render_error
          render json: { errors: @recording.errors.full_messages },
                 status: :unprocessable_entity
        end
        
      end
    end
  end
end