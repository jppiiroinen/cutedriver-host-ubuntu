#!/usr/bin/ruby
require 'minitest/autorun'
require 'tdriver'
include TDriverVerify

APPNAME = ARGV[0]

class TestHelloWorld < MiniTest::Test
  def setup
    @sut = TDriver.sut(:sut_qt)
    @app = @sut.run( :name => "#{APPNAME}", :arguments => "-testability", :sleeptime => 2 )
    @mainWindow = @app.child( :name => "MainWindow" )
    verify(1, "MainWindow was found") { @mainWindow }
  end

  def test_smoke
    verify_equal("label", 1, "default label text'") {
      @mainWindow.child( :name => 'label' )['text']
    }
    
    verify { @mainWindow.child( :name => 'pushButton').tap }

    verify_equal("Clicked", 1, "label changed") {
      @mainWindow.child( :name => 'label')['text']
    }
  end

  def teardown
    @app.kill
  end
end
