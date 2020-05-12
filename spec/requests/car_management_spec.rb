require 'rails_helper'

describe 'car management' do
  context 'index' do
    it 'renders available cars' do
      cars = create_list(:car, 3, status: :available)
      unavailable_car = create(:car, status: :rented)

      get api_v1_cars_path

      response_json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(response_json.count).to eq(3)
      expect(response_json[0][:license_plate]).to eq(cars.first.license_plate)
      expect(response_json[0][:color]).to eq(cars.first.color)
      expect(response_json[0][:mileage]).to eq(cars.first.mileage)
      expect(response_json[0][:car_model_id]).to eq(cars.first.car_model_id)
      expect(response_json[1][:license_plate]).to eq(cars.second.license_plate)
      expect(response_json[2][:license_plate]).to eq(cars.third.license_plate)
      expect(response.body).to_not include(unavailable_car.license_plate)
    end

    it 'renders empty json' do
      get api_v1_cars_path

      response_json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(response_json).to be_blank
    end
  end
end