class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

  private

  def record_not_found(exception)
    model_name = exception.model.constantize.model_name.human
    render json: "#{model_name} não encontrado", status: :not_found
  end

  def unprocessable_entity_response(exception)
    render json: exception.record.errors.full_messages, 
           status: :unprocessable_entity
  end
end