require 'debugger'
class Fixnum

  def in_words

    result = []

    # create integers array
    integers = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']

    return integers[self] if self <= 10

    # create teens array
    teens = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
    return teens[(self - 11)] if (self < 20)

    # create tens array
    tens = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']

    # create fillers array (hundreds, thousands, etc)
    fillers = ['hundred', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion', 'sextillion',
              'septillion', 'octillion', 'nonillion', 'decillion', 'undecillion', 'duodecillion', 'tredecillion', 'quattuordecillion']

    # replicate self so true value remains
    dup = self
    counter = 0
    # loop until self is less than 1000

    while dup > 1000
      to_check = dup % 1000

      # refactor code for %
      ten_check = to_check / 10
      hundred_check = to_check / 100

      #handle case for eleven - nineteen
      hundred = to_check % 100
      if hundred > 10 && hundred < 20
        result << teens[(hundred - 11)]
      else
        result << integers[(to_check / 1) % 10] unless ((to_check / 1) % 10 == 0)
        result << tens[ten_check % 10 - 1] unless (ten_check % 10 == 0)
      end

      # add fillers
      # result << 'and'

      result << fillers[0] unless hundred_check == 0
      result << integers[hundred_check % 10] unless (hundred_check % 10 == 0)
      result << fillers[counter] unless to_check / 100 == 0

      counter += 1
      dup = dup / 1000
    end


    # for the final 3 numbers after dividing by 1000
    if dup <= 10
      result << fillers[counter]
      result << integers[dup]
    elsif dup < 20
      result << fillers[counter]
      result << teens[dup - 11]
    elsif dup < 100
      result << integers[dup % 10] unless (dup % 10 == 0)
      result << tens[(dup / 10) - 1]
    else dup <= 1000
      result << 'thousand' if dup == 1000
      if (dup % 100) < 20 && (dup % 100 > 10)
        result << teens[(dup % 100) - 11]
      else
        result << integers[(dup / 1) % 10] unless ((dup / 1) % 10 == 0)
        result << tens[(dup / 10) % 10 - 1] unless ((dup / 10) % 10 == 0)
      end
      # result << 'and'
      result << fillers[0]
      result << integers[(dup / 100) % 10] unless ((dup / 100) % 10 == 0)
    end

    result.reverse.join(" ")

  end

end









