class TwitterCacheClient
  def initialize(options = {}, &block)
    @client = Twitter::REST::Client.new(&block)
    @expires_in = (options[:expires_in] || 5.minutes).to_i
  end

  def method_missing(method_name, *m_args, &block)
    if respond_to?(method_name)
      self.class.class_eval do
        define_method(method_name) do |*args|
          Rails.cache.fetch("twitter:#{method_name}:#{args}", expires_in: @expires_in) do
            @client.send(method_name, *args)
          end
        end
      end
      send(method_name, *m_args)
    else
      raise "Method `#{method_name}` doesn't exist."
    end
  end

  def respond_to?(method_name, _include_private = false)
    @client.methods.include?(method_name.to_sym)
  end
end
