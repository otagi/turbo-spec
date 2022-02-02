require 'rails_helper'

describe Rodent do
  subject { build(:rodent) }
  it { is_expected.to be_valid }
end
