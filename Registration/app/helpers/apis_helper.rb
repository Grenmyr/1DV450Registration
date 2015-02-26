module ApisHelper
  # This method is for encoding the JWT before sending it out
  def encodeJWT(creator, exp=2.hours.from_now)
# add the expire to the payload, as an integer
    payload = { creators_id: creator.id }
    payload[:exp] = exp.to_i
# Encode the payload whit the application secret, and a more advanced hash method (creates header with JWT gem)
    JWT.encode( payload, Rails.application.secrets.secret_key_base, "HS512")
  end
  # When we get a call we have to decode it - Returns the payload if good otherwise false
  def decodeJWT(token)
# puts token
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base, "HS512")
# puts payload
    if payload[0]['exp'] >= Time.now.to_i
        payload
    else
      puts 'time expired on login'
      false
    end
# catch the error if token is wrong
  rescue => error
    puts error
    nil
  end

  def create_error_types
    {developerMessage: :'Need to include type_ids as array to your event object.EX: event:{event_ids:[1,2]}',
     userMessage: :'You need to add what type of saving it is'}
  end

  def create_error_message
    {developerMessage: :'',
     userMessage: :'Error when saving.'}
  end

  def get_error_message
    {developerMessage: :"Could not find resource: #{params[:id]}",
     userMessage: :"Could not find any #{params[:id]}"}
  end

end
