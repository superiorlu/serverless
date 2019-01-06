require 'json'
require 'morse_code'

def handler(event:, context:)
  params = event['queryStringParameters'] || Hash.new('')
  content = MorseCode::Decoder.new(params['content']).decode
  body = { content: content, original: params['content'] }
  { statusCode: 200, body: JSON.generate(body) }
end
