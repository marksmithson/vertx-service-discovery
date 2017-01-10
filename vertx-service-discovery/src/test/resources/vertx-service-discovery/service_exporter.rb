require 'vertx/vertx'
require 'vertx/future'
require 'vertx-service-discovery/service_publisher'
require 'vertx/util/utils.rb'
# Generated from io.vertx.servicediscovery.spi.ServiceExporter
module VertxServiceDiscovery
  #  The service exporter allows integrate other discovery technologies with the Vert.x service discovery. It maps
  #  entries from another technology to a  and maps  to a publication in this other
  #  technology. The exporter is one side of a service discovery bridge.
  class ServiceExporter
    # @private
    # @param j_del [::VertxServiceDiscovery::ServiceExporter] the java delegate
    def initialize(j_del)
      @j_del = j_del
    end
    # @private
    # @return [::VertxServiceDiscovery::ServiceExporter] the underlying java delegate
    def j_del
      @j_del
    end
    @@j_api_type = Object.new
    def @@j_api_type.accept?(obj)
      obj.class == ServiceExporter
    end
    def @@j_api_type.wrap(obj)
      ServiceExporter.new(obj)
    end
    def @@j_api_type.unwrap(obj)
      obj.j_del
    end
    def self.j_api_type
      @@j_api_type
    end
    def self.j_class
      Java::IoVertxServicediscoverySpi::ServiceExporter.java_class
    end
    #  Starts the exporter.
    # @param [::Vertx::Vertx] vertx the vertx instance
    # @param [::VertxServiceDiscovery::ServicePublisher] publisher the service discovery instance
    # @param [Hash{String => Object}] configuration the bridge configuration if any
    # @param [::Vertx::Future] future a future on which the bridge must report the completion of the starting
    # @return [void]
    def init(vertx=nil,publisher=nil,configuration=nil,future=nil)
      if vertx.class.method_defined?(:j_del) && publisher.class.method_defined?(:j_del) && configuration.class == Hash && future.class.method_defined?(:j_del) && !block_given?
        return @j_del.java_method(:init, [Java::IoVertxCore::Vertx.java_class,Java::IoVertxServicediscoverySpi::ServicePublisher.java_class,Java::IoVertxCoreJson::JsonObject.java_class,Java::IoVertxCore::Future.java_class]).call(vertx.j_del,publisher.j_del,::Vertx::Util::Utils.to_json_object(configuration),future.j_del)
      end
      raise ArgumentError, "Invalid arguments when calling init(#{vertx},#{publisher},#{configuration},#{future})"
    end
    #  Notify a new record has been published, the record's registration can be used to uniquely
    #  identify the record
    # @param [Hash] record the record
    # @return [void]
    def on_publish(record=nil)
      if record.class == Hash && !block_given?
        return @j_del.java_method(:onPublish, [Java::IoVertxServicediscovery::Record.java_class]).call(Java::IoVertxServicediscovery::Record.new(::Vertx::Util::Utils.to_json_object(record)))
      end
      raise ArgumentError, "Invalid arguments when calling on_publish(#{record})"
    end
    #  Notify an existing record has been updated, the record's registration can be used to uniquely
    #  identify the record
    # @param [Hash] record the record
    # @return [void]
    def on_update(record=nil)
      if record.class == Hash && !block_given?
        return @j_del.java_method(:onUpdate, [Java::IoVertxServicediscovery::Record.java_class]).call(Java::IoVertxServicediscovery::Record.new(::Vertx::Util::Utils.to_json_object(record)))
      end
      raise ArgumentError, "Invalid arguments when calling on_update(#{record})"
    end
    #  Notify an existing record has been removed
    # @param [String] id the record registration id
    # @return [void]
    def on_unpublish(id=nil)
      if id.class == String && !block_given?
        return @j_del.java_method(:onUnpublish, [Java::java.lang.String.java_class]).call(id)
      end
      raise ArgumentError, "Invalid arguments when calling on_unpublish(#{id})"
    end
    #  Close the exporter
    # @yield the handle to be notified when exporter is closed, may be <code>null</code>
    # @return [void]
    def close
      if block_given?
        return @j_del.java_method(:close, [Java::IoVertxCore::Handler.java_class]).call(Proc.new { yield })
      end
      raise ArgumentError, "Invalid arguments when calling close()"
    end
  end
end