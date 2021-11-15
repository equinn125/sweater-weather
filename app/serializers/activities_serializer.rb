class ActivitiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination, :forecast, :activities
end
