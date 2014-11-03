FactoryGirl.define do
    factory :article do
      date "November 1, 2014"
      title "Test title"
      language "Ruby"
      runtime "O(n)"
      code "def hello world"
      problem "hello world"
      content "hello world!!"
    end

    factory :tag do
      name "test"
    end
end