class Hackplatformrelation < ActiveRecord::Base
  belongs_to :platform
  belongs_to :hack
end
