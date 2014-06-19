class UntestedModel < ActiveRecord::Base

  def this_is_an_untested_method
    "and should be highlighted as untested"
  end

  def this_is_tested
    true
  end

  def this_is_a_complicated_method
    2 + 2 
    tot = 100
    %w{f10oo b40ar}.each do |label|
      tot += label.to_i 
    end
    "#{tot} - #{['a','b','v'].join('/')}"
  end
end
