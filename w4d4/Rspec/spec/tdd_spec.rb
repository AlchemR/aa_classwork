gem "rspec"
require "tdd"

describe Array do

describe "Array#my_uniq" do 
let(:arr) {[1,2,3,4,3,2,4]} #should be [1,2,3,4]

    it "returns the array without any duplicates" do 
      # arr = [1,2,3,4,3,2,4]
      expect(arr.my_uniq).to eq(arr.uniq)
      # expect(arr.my_uniq).to eq(arr.uniq)

    end

    it "return the unique elements in the order in which they first appeared" do 
      expect(arr.my_uniq).to eq([1, 2, 3, 4])
    end

    #returns array class?

end #uniq


describe "two_sum" do 

  it "returns positions of pairs of  numbers that add to zero" do
    expect([-1, 0,2,-2,1].two_sum).to eq([[0,4], [2,3]])
  end 

it "should return the pairs sorted, smaller index before the larger index, 'dictionary wise' " do 
  expect([-3, 2,0,-2,3].two_sum).to eq([[0,4], [1,3]])
    # expect([-3, 2,0,-2,3].two_sum).to eq([1,3], [0,4])
  #to not eq
end
end

describe "Array#my_transpose" do
it "takes a 2-D grid of arrays, and switches the rows and columns" do 
    rows = [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
    cols = [ [0, 3, 6], [1, 4, 7], [2, 5, 8] ]
    expect(rows.my_transpose).to eq(cols)
    # expect(rows.my_transpose).to eq(rows.transpose)
end
end

describe "Array#stock_picker" do 
it "takes in an array, finds the maximum delta between two indices" do 
stonks = [10,14,19,9,5,30]
expect(stonks.stock_picker).to eq([4,5])
end
end

end#array