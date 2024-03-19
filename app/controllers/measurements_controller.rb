class MeasurementsController < ApplicationController
    before_action :set_measurement, only: [ :update, :destroy, :show]
    before_action :authenticate_request, only: [:create, :update, :destroy]
  
    def index
      measurements = Measurement.all 
      render json: MeasurementBlueprint.render_as_hash(measurements, view: :normal), status: 200
  
      # render json: measurements, status: 200
    end
  
    def show
  
      render json: @measurement, status: 200
    end
  
    def create
      measurement = Measurement.new(measurement_params)
      if measurement.save
        render json: measurement, status: :created
      else
        render json: measurement.errors, status: :unprocessable_entity
      end
    end
  
    def update
        
      if @measurement.update(measurement_params)
        render json: @measurement, status: :ok
      else
        render json: @measurement.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @measurement.destroy
        render json: nil, status: :ok
      else
        render json: @measurement.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def measurement_params
      params.permit(:unit_measurement)
    end
  
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end
  end
