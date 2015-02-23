class ApisController < ApplicationController
  include ApisHelper
  before_action :validate_login, only: [:edit]


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

  def selected_format (search,optional)
    respond_to do |format|
      format.json { render json: search, status: optional }
      format.xml { render xml: search, status: optional }
    end
  end

  def get_error_message
    {developerMessage: :"Could not find resource: #{params[:id]}",
     userMessage: :"Could not find any #{params[:id]}"}
  end

  def create_error_message
    {developerMessage: :'',
     userMessage: :'Error when saving.'}
  end

  def check_api_key
    key = Api.find_by(key: params[:apiKey])
    if key.nil?
      selected_format({apiKey: 'Not valid key'},:bad_request)
    end
  end


  ####### API auth stuff with JWT
  # This is a callback which actiosn will call if protected
  def developer_key_authentication
    authenticate_or_request_with_http_token do |token|
        Api.exists?(key: token)
    end
  end

  def client_key_authentication
    if request.headers['JWT'].present?
      auth_header = request.headers['JWT'].split(' ').last
      @token_payload = decodeJWT auth_header.strip
      if !@token_payload
        render json: { error: 'The provided token wasn´t correct' }, status: :bad_request
      end
    else
      render json: { error: 'Need to include the Authorization header' }, status: :forbidden # The header isn´t present
    end
  end


  def api_login
    creator = Creator.find_by(name: request.headers['name'])
    if creator && creator.authenticate(request.headers['password'])
      selected_format(encodeJWT(creator),:ok)
      #encodeJWT(creator)
    else
      selected_format({ error: 'Invalid username or password' },:unauthorized)
    end
  end



  # FOR LIMIT AND OFFSET
  def offset_and_limit_params(model_all)
    if params[:offset].present? and params[:limit].present?
      if params[:order].present? and params[:order] === 'date'
        data =model_all.limit(params[:limit]).offset(params[:offset]).order('created_at DESC')
      else
        data =model_all.offset(params[:offset]).limit(params[:limit])
      end
      selected_format({event: data},:created)
    else
      if params[:order].present? and params[:order] === 'date'
        data =model_all.order('created_at DESC')
      else
        data = model_all
      end
      selected_format({event: data},:ok)
    end
    end
end
