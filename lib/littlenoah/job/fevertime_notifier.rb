require 'twitter'
require 'littlenoah/fever_schedule'

module Littlenoah

module Job

  class FevertimeNotifier
    
    def initialize(conf)
      @config = conf
    end

    def run
      time = Time.now
      notify(time) if should_notify?(time)
    end

    def notify(time)
      twitter.update(notify_message(notify_to, time))
    end

    def notify_message(to, time)
      "@#{to} littlenoah fevertime!! #{time.to_s}"
    end

    def notify_to
      @config[:notify_to]
    end

    def should_notify?(time)
      schedule(time.wday).fever?(time.hour)
    end

    def schedule(wday)
      Littlenoah::FeverSchedule.new(wday)
    end

    def twitter
      Twitter::REST::Client.new do |config|
        config.consumer_key        = @config[:consumer_key]
        config.consumer_secret     = @config[:consumer_secret]
        config.access_token        = @config[:access_token]
        config.access_token_secret = @config[:access_secret]
       end
    end

  end

end

end
