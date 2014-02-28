require 'spec_helper'

describe LinkSub do

  it { should belong_to :link }
  it { should belong_to :sub }

end
