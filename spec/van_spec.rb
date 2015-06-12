require 'van'
require 'support/shared_examples_for_bike_container'

describe Van do

  it_behaves_like BikeContainer

  it { is_expected.to respond_to(:load).with(1).argument }

  it 'can drive to garage' do
    subject.drive_to_garage
    expect(subject.location).to eq :garage
  end

  it 'can drive from to dock' do
    subject.drive_to_dock
    expect(subject.location).to eq :dock
  end

  it 'allows unloading of working bike' do
    subject.load double :bike, working?: true
    expect(subject.unload_working_bike).to be_working?
  end

end