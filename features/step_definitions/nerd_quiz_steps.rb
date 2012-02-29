Given /^I am not yet taking a quiz$/ do
end

When /^I start a new quiz$/ do
  NerdQuiz::Quiz.new(output).start
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include message
end


Given /^I am conducting a quiz$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I ask the question "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^A quizer answers "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should mark the answer as "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I receive an answered question$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^the question is the (\d+)th$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I score the question$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I complete the quiz$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I ask the quizer, "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I receive (\d+) correct answers$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I complete the quiz$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I display "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I am asked the question "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I answer "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see my score increase by (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I do not see my score change$/ do
  pending # express the regexp above with the code you wish you had
end
