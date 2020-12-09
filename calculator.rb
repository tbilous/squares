require 'pry'
module Calculator
  extend self

  def converter(arr)
    keys = %i[x y]
    res = []
    arr.each_with_index do |k, i|
      res << [keys[i], k]
    end
    res.to_h
  end

  def call(args)
    r1_top, r1_bottom, r2_top, r2_bottom = args.map { |i| converter(i) }

    # solution when we decided - squares do not overlap if they have a corner in the same point both
    # Example #3 got the red test
    #
    # return false if r1_top[:x] >= r2_bottom[:x] || r2_top[:x] >= r1_bottom[:x]
    # return false if r1_top[:y] <= r2_bottom[:y] || r2_top[:y] <= r1_bottom[:y]


    # solution when we decided - squares overlap if have a corner in the same point both
    # All examples have green tests
    return false if r1_top[:x] > r2_bottom[:x] || r2_top[:x] > r1_bottom[:x]
    return false if r1_top[:y] < r2_bottom[:y] || r2_top[:y] < r1_bottom[:y]

    true
  end
end
