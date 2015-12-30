#RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
#  config.default = RGeo::Geographic.spherical_factory(srid: 4326) 
#end
#RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
#  # By default, use the GEOS implementation for spatial columns.
#  config.default = RGeo::Geographic.spherical_factory(srid: 4326) 
#  #config.default = RGeo::Geos.factory_generator
#
#  # But use a geographic implementation for point columns.
#  config.register(RGeo::Geographic.spherical_factory(srid: 4326), geo_type: "point")
#end
#
RGeo::ActiveRecord::GeometryMixin.set_json_generator(:geojson)
