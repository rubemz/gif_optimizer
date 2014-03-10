require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe GifOptimizer::Optimizer do
  describe '#optimize' do
    let(:gif_optimizer) { GifOptimizer::Optimizer.new('/path/to/file.gif') }
    let(:optimizer_options) { %w[-b -O3 /path/to/file.gif] }

    it 'optimizes the gif' do
      gif_optimizer.stub(:gif_optimizer_bin => '/usr/local/bin/gifsicle')
      gif_optimizer.should_receive(:system).with('/usr/local/bin/gifsicle', *optimizer_options)
      gif_optimizer.optimize
    end

    it 'warns the user if the gif optimizing utility is not installed' do
      gif_optimizer.stub(:gif_optimizer_bin => '')
      gif_optimizer.should_receive(:warn).with('Attempting to optimize a gif without gifsicle installed. Skipping...')
      gif_optimizer.optimize
    end

    it 'detects if there is an ENV variable path to gifsicle' do
      image_optim_gifsicle_bin_path = '/app/vendor/bundle/ruby/2.0.0/gems/image_optim_bin-0.0.2/bin/gifsicle'
      ENV['GIFSICLE_BIN'] = image_optim_gifsicle_bin_path
      gif_optimizer.should_receive(:system).with(image_optim_gifsicle_bin_path, *optimizer_options)
      gif_optimizer.optimize
    end
  end
end
