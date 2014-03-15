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

  def self.future(l)
    Java::scala.concurrent.package.future(l, default_ec)
  end

end


