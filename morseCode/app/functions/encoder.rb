require 'json'
require 'morse_code'

def handler(event:, context:)
  params = event['queryStringParameters'] || Hash.new('')
  content = MorseCode::Encoder.new(params['content']).encode
  body = { content: content, original: params['content'] }
  { statusCode: 200, body: JSON.generate(body) }
end
