class ActivitiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination, :forecast, :activites
end
