require 'van'
require 'support/shared_examples_for_bike_container'

describe Van do

  it_behaves_like BikeContainer

  it { is_expected.to respond_to :unload }

end