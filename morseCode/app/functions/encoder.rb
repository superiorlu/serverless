require 'json'
require 'aws-sdk'
require 'morse_code'

def handler(event:, context:)
  params = event['queryStringParameters'] || Hash.new('')
  body = if params['content'].empty?
           { content: '', original: '' }
         else
           encoder = MorseCode::Encoder.new(params['content'])
           content = encoder.encode
           wavefile = encoder.wave
           s3 = Aws::S3::Resource.new(region: 'us-west-1')
           bucket = s3.bucket(ENV['BUCKET'])
           object = bucket.object(wavefile.split('/').last)
           object.upload_file(wavefile)
           { content: content, original: params['content'], wav_url: object.presigned_url(:get, expires_in: 1800) }
        end
  { statusCode: 200, body: JSON.generate(body) }
end
