module GifOptimizer
  class Optimizer
    attr_reader :path, :options

    def initialize(path, options = {})
      @path = path
      @options = options
    end

    def optimize
      return unless gif_format?

      if optimizer_present?
        optimize_gif
      else
        warn 'Attempting to optimize a gif without gifsicle installed. Skipping...'
      end
    end

    private

    def gif_format?
      ['gif'].include? extension(path)
    end

    def extension(path)
      path.split('.').last.downcase
    end

    def optimize_gif
      system(gif_optimizer_bin, *command_options)
    end

    def command_options
      flags = ['-b', '-O3']
      flags << path
    end

    def optimizer_present?
      !gif_optimizer_bin.nil? && !gif_optimizer_bin.empty?
    end

    def gif_optimizer_bin
      @gif_optimizer_bin ||= ENV['GIFSICLE_BIN'] || `which gifsicle`.strip
    end
  end
end
