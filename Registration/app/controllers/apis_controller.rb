class ApisController < ApplicationController
  include ApisHelper
  before_action :validate_login, only: [:edit]
  before_action :developer_key_authentication


  # User to set api key to nil or new random value.
  def edit
    @user = User.find(current_user.id)
    if @user.api.key.nil?
      @user.api.key = SecureRandom.hex
      if@user.api.save
        redirect_to @user
        flash[:success] = 'New api key' +@user.api.key + ' was created'
      else
        render @user
        flash.now[:danger] = 'Api key could not be saved'
      end
    else
      @user.api.key = nil
      @user.api.save
      redirect_to user_path
      flash[:success] = 'Api key was removed'
    end
  end

  #CODE FOR API

  protect_from_forgery with: :null_session

  #Function used from creators,events,positions,types controllers to present Json or XML format along with status Code
  def selected_format (search,optional)
    respond_to do |format|
      format.json { render json: search, status: optional }
      format.xml { render xml: search, status: optional }
    end
  end

=begin
  #Check if api key exist in params
  def check_api_key
    key = Api.find_by(key: params[:apiKey])
    if key.nil?
      selected_format({apiKey: 'Not valid key'},:bad_request)
    end
  end
=end


  ####### Check for developer token exist
  def developer_key_authentication
    authenticate_or_request_with_http_token do |token|
        Api.exists?(key: token)
    end
  end

  # Check Jason web token is present and correct.
  def client_key_authentication
    if request.headers['JWT'].present?
      auth_header = request.headers['JWT'].split(' ').last
      @token_payload = decodeJWT auth_header.strip
      if @token_payload
        @creators_id = @token_payload[0]['creators_id']
      else
        selected_format({ error: 'The provided token wasn´t correct' },:bad_request)
      end
    else
      selected_format({ error: 'Need to include the Authorization header JWT with correct key' },:forbidden)
    end
  end

  # Route used to log in on client account.
  def api_login
    creator = Creator.find_by(name: request.headers['name'])
    if creator && creator.authenticate(request.headers['password'])
      selected_format(encodeJWT(creator),:ok)
    else
      selected_format({ error: 'Invalid username or password' },:unauthorized)
    end
  end

  # Route used to register new api client account.
  def api_register
    creator = Creator.new(submits: 0, name: request.headers['name'],password: request.headers['password'],password_confirmation: request.headers['password'])
    if creator.save
      selected_format(encodeJWT(creator),:ok)
    else
      error = create_error_message
      error[:developerMessage] = creator.errors
      selected_format(error, :bad_request)
    end
  end



  # FOR LIMIT AND OFFSET
  def offset_and_limit_and_order_params(model_all)
    if params[:offset].present? and params[:limit].present?
      if params[:order].present? and params[:order] === 'date'
        data =model_all.limit(params[:limit]).offset(params[:offset]).order('created_at DESC')
      else
        data =model_all.offset(params[:offset]).limit(params[:limit])
      end
      selected_format({data: data},:created)
    else
      if params[:order].present? and params[:order] === 'date'
        data =model_all.order('created_at DESC')
      else
        data = model_all
      end
      "Could not find any #{params[:id]}"
      selected_format({data: data},:ok)
    end
    end
end
