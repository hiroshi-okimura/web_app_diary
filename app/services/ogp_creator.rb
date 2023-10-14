class OgpCreator
  require 'mini_magick'

  BASE_IMAGE_PATH = './app/assets/images/ogp_back.png'.freeze
  GRAVITY = 'center'.freeze
  TEXT_POSITION = '0,-25'.freeze
  FONT = './app/assets/fonts/Harenosora.otf'.freeze
  FONT_SIZE = 70
  INDENTION_COUNT = 12
  ROW_LIMIT = 5
  BETWEEN_LINES = 4

  def self.build(site_name)
    text = prepare_text(site_name)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.fill '#000000'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
      config.interline_spacing BETWEEN_LINES
    end
  end

  def self.prepare_text(site_name)
    site_name.to_s.scan(/.{1,#{INDENTION_COUNT}}/o)[0...ROW_LIMIT].join("\n")
  end
end
