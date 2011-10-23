class Statushackrelation < ActiveRecord::Base
  belongs_to :status
  belongs_to :hack
end
