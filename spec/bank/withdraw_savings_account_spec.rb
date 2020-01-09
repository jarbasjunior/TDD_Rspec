require_relative '../../app/bank.rb'

describe SavingsAccount do
  describe 'Withdraw' do
    context 'When the value is positive' do
      before(:all) do
        @savings_account = SavingsAccount.new(1000.00)
        @savings_account.withdraw(200.00)
      end
      it 'Then update balance' do
        expect(@savings_account.balance).to eq 799.00
      end
    end

    context 'When the balance is zeroed' do
      before(:all) do
        @savings_account = SavingsAccount.new(0.00)
        @savings_account.withdraw(400.00)
      end
      it 'Then I see message' do
        expect(@savings_account.message).to eq 'Insufficient balance for withdraw'
      end

      it 'And the balance remains zeroed' do
        expect(@savings_account.balance).to eq 0.00
      end
    end

    context 'When the balance is insufficient' do
      before(:all) do
        @savings_account = SavingsAccount.new(500.00)
        @savings_account.withdraw(501.00)
      end
      it 'Then I see message' do
        expect(@savings_account.message).to eq 'Insufficient balance for withdraw'
      end

      it 'And the balance remains zeroed' do
        expect(@savings_account.balance).to eq 500.00
      end
    end

    context 'When the withdrawal limit is reached' do
      before(:all) do
        @savings_account = SavingsAccount.new(1000.00)
        @savings_account.withdraw(501.00)
      end
      it 'Then I see message' do
        expect(@savings_account.message).to eq 'Withdrawal limit is R$ 500'
      end

      it 'And the balance remains the same as the initial' do
        expect(@savings_account.balance).to eq 1000.00
      end
    end
  end
end
