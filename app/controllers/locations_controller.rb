class LocationsController < ApplicationController
   before_action :set_location, only: [:show, :edit, :update, :destroy, :create, :new]
   before_action :user



end
