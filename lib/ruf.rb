require "ruf/version"
require 'scala-library-jars'
require 'java'

module Ruf
  java_import 'scala.concurrent.Future'
  java_import 'scala.concurrent.Await'
  java_import 'scala.concurrent.duration.Duration'
  java_import 'scala.concurrent.ExecutionContext'
  java_import 'java.util.concurrent.Executors'

  def self.default_ec
    $default_ec ||= ExecutionContext.fromExecutorService(Executors.newFixedThreadPool(10))
    $default_ec
  end

  def self.shutdown
    $default_ec.shutdown if $default_ec
    $default_ec = nil
  end

  def self.future(l = nil, &block)
    callable = l || block
    Java::scala.concurrent.package.future(callable, default_ec)
  end

  def self.await_result(future, options={})
    Await.result(future, Duration[options[:timeout]])
  end
end


