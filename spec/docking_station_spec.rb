require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do

  it_behaves_like BikeContainer

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = double :bike, broken?: false
    subject.dock bike
    expect(subject.release_bike).to be bike
  end

  it 'does not release broken bikes' do
    bike = double :bike, broken?: true
    subject.dock bike
    expect{ subject.release_bike }.to raise_error "No bikes available"
  end


  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'dock' do
    it "raises an error when the dock is full" do
      subject.capacity.times { subject.dock double(:bike) }
      expect { subject.dock double(:bike) }.to raise_error "DockingStation full"
    end
  end

end
