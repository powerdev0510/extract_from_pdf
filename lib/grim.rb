# encoding: UTF-8
require 'shellwords'

module Grim
  extend self
  attr_accessor :processor

  # Default resize output width, any positive integer
  WIDTH = 1024

  # Default image quality, 1 to 100
  QUALITY = 90

  # Default density, any positive integer
  DENSITY = 300

  # Default colorspace
  COLORSPACE = "RGB"

  # Default exception class for Grim.
  class Exception < ::StandardError
  end

  # Exception that is raised if pdf is not found.
  class PdfNotFound < Grim::Exception
  end

  # Exception that is raised if pdf does not have page
  class PageNotFound < Grim::Exception
  end

  # Exception that is raised if an empty path is passed to Grim::Page#save
  class PathMissing < Grim::Exception
  end

  # Exception that is raised if Grim::Page#save can't process the page
  class UnprocessablePage < Grim::Exception
  end

  # Creates and returns a new instance of Grim::Pdf
  #
  # path - a path string or object
  #
  # For example:
  #
  #   pdf = Grim.reap(/path/to/pdf)
  #
  # Returns an instance of Grim::Pdf
  #
  def self.reap(path)
    Grim::Pdf.new(path)
  end

  # Set a Logger compatible logger for Grim.
  #
  # logger - Object with same interface as Logger.new
  def self.logger=(logger)
    @logger = logger
  end

  # Logger to use internally. Defaults to Grim::NullLogger.
  #
  # Returns a Logger compatible logger.
  def self.logger
    @logger ||= Grim::NullLogger.new
  end
end

require 'grim/pdf'
require 'grim/page'
require 'grim/image_magick_processor'
require 'grim/multi_processor'
require 'grim/null_logger'

Grim.processor = Grim::ImageMagickProcessor.new
