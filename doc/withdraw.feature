User Scenario Outline: ATM withdrawal
  As a ninja bank account holder
  I want to withdraw money
  So I can buy in places that accept credit or debit

Scenario: Withdraw from checking account
  Given that I have R$ 1000 in my checking account
  When I make a R$ 200 withdrawal
  Then my balance should be R$ 800

Scenario: Zeroed account balance
  Given that I have R$ 0 in my checking account
  When I make R$ 400 withdrawal
  Then I see message 'Insufficient balance for withdraw'
  And my balance should conitnue R$ 0

Scenario: Insufficient account balance
  Given that I have R$ 500 in my checking account
  When I make R$ 501 withdrawal
  Then I see message 'Insufficient balance for withdraw'
  And my balance should continue R$ 500

Scenario: Withdrawal limit
  Given that I have R$ 1000 in my checking account
  When I make R$ 701 withdrawal
  Then I see message 'Withdrawal limit is R$ 700'
  And my balance should continue R$ 1000

# report in html -> rspec --format html --out report.html
# report for ci  -> rspec --format RspecJunitFormatter --out report.xml