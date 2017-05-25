require 'rails_helper'

RSpec.describe User, type: :model do
  it {should have_many(:ideas)}
  xit {should have_many(:categories)}
  xit {should validate_presence_of(:username)}
  xit {should validate_presence_of(:password)}
  xit {should validate_uniqueness_of(:username)}
  xit {should validate_presence_of(:email)}
  xit {should validate_uniqueness_of(:email)}
  xit {should have_db_column(:role).with_options(default: 0)}

end
