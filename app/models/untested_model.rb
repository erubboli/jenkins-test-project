class UntestedModel < ActiveRecord::Base

  def this_is_an_untested_method
    "and should be highlighted as untested"
  end

  def this_is_tested
    true
  end
end
