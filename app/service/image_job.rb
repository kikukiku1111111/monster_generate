require 'open-uri'

class ImageJob < ApplicationJob
  queue_as :default

  PERMIT_IMAGE_FORMAT = %w[png jpg jpeg].freeze

  def perform(monster, image_url)
    #valid_image_format = get_content_type(image_url)
    #return unless valid_image_format

    uri = URI.parse(image_url)
    image = uri.open
    image_name = File.basename(image_url)
    monster.image.attach(io: image, filename: image_name) #content_type: valid_image_format)
  end

  private

  def get_content_type(image_url)
    ext_name = File.extname(image_url).delete('.')
    return unless PERMIT_IMAGE_FORMAT.include?(ext_name)

    "image/#{ext_name}"
  end
end