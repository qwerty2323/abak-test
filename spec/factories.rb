FactoryGirl.define do

  factory :page, :class => Page do
    sequence(:title) {|n| "Page #{n}" }
    sequence(:slug)  {|n| "page#{n}"}
    content '**bold** \\\\italic\\\ stuff and ((/home links too))'
  end

end