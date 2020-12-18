#START:P1
FactoryBot.define do
    factory :task do

      sequence :title, 100 do |n| 
        "Task #{n}" 
      end
      size {"3"}
      completed_at {"nil"}
  
      trait :small do
        size {"1"}
      end
  
      #END:P1
      
      #START:P2
      trait :large do
        size {"5"}
      end
  
      trait :soon do
        due_date { 1.day.from_now }
      end
  
      trait :later do
        due_date { 1.month.from_now }
      end
  
      trait :newly_complete do
        completed_at { 1.day.ago }
      end
  
      trait :long_complete do
        completed_at { 6.months.ago }
      end
  
      factory :trivial do
        small
        later
      end
      factory :panic do
        large
        soon
      end
  
    end
  
  end
  #END:P2
  