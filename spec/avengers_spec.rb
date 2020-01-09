class AvengersHeadQuarter
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(avenger)
    list.push(avenger)
  end
end

describe AvengersHeadQuarter do
  it 'Must add avenger' do
    hq = AvengersHeadQuarter.new

    hq.put('Spiderman')
    expect(hq.list).to eq ['Spiderman']
  end

  it 'Must add a list of avengers' do
    hq = AvengersHeadQuarter.new
    hq.put('Thor')
    hq.put('Hulk')
    hq.put('Spiderman')
    # res = hq.list.empty?
    expect(hq.list).to include 'Hulk'
    expect(hq.list.size).to be > 0 # or
    # expect(res).to be false
  end

  it 'Spiderman should be first on the list' do
    hq = AvengersHeadQuarter.new
    hq.put('Spiderman')
    hq.put('Thor')
    hq.put('Hulk')
    expect(hq.list).to start_with('Spiderman')
  end

  it 'Thor should be last on the list' do
    hq = AvengersHeadQuarter.new
    hq.put('Spiderman')
    hq.put('Hulk')
    hq.put('Thor')
    expect(hq.list).to end_with('Thor')
  end

  it 'Must contain last name' do
    avenger = 'Peter Parker'

    expect(avenger).to match(/Parker/)
    expect(avenger).not_to match(/Ironman/)
  end
end
