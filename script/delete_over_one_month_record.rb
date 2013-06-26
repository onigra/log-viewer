#!/usr/bin/env ruby
require File.expand_path('../../config/application',  __FILE__)
Rails.application.require_environment!

require "thor"

class PurgeSlowLogs< Thor
  desc "check", "check over one month record"
  def check
    list = SlowLog.over_one_month

    list.each do |l|
      puts l.inspect
    end
  end

  desc "execute", "delete over one month record"
  def execute
    logger ||= ActiveSupport::BufferedLogger.new(File.join(Rails.root, 'log', "#{Rails.env}_batch.log"))
    logger.info("Delete Start over one month: " << (Time.now).strftime("%Y-%m-%d %H:%M:%S") << "\n")
    
    list = SlowLog.over_one_month
    list.each do |l|
      logger.info(l.inspect) 
      l.destroy
    end

    logger.info("\nDelete End over one month \n")
  end
end

PurgeSlowLogs.start
