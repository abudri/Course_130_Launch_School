class Series
  attr_reader :num_arr

  def initialize(number)
    @num_arr = number.split('').map(&:to_i)
  end

  def slices(slice_length)
    raise ArgumentError, 'Slices can not be longer than array size itself' if num_arr.size < slice_length

    i = slice_length
    start = 0
    count = num_arr.size # Array#size here
    result = []

    while i < count + 1
      result << num_arr[start..i - 1]
      i += 1
      start += 1
    end
    result
  end
end
