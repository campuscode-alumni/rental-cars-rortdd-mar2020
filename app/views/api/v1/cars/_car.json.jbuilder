json.(car, :id, :license_plate, :color, :mileage, :car_model_id)
json.url api_v1_cars_path(car, format: :json)