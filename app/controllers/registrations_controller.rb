class RegistrationsController < Devise::RegistrationsController
  respond_to :json, only: [:create]
 
end 
