class BudgetsController < ApplicationController
    
    $ALLOWANCE = 30.0
    
    def index
        @budgets = Budget.all
        render json: @budgets
    end
    
    def home
        owners = ["Ally", "McKay"]
        owners.each { |owner| update_allowance(owner)}
        time_range = time_range_for( Time.now.year, Time.now.month )
        @budgets   = Budget.where(spent_on: time_range).order(:spent_on)
        @new_entry = Budget.new
        
        ally_allowance = Allowance.find_by(owner: "Ally")
        mckay_allowance = Allowance.find_by(owner: "McKay")
        
        @ally_spent = 0.0
        @mckay_spent = 0.0
        
        @budgets.each do |budget|
            if budget.owner == "Ally"
                @ally_spent += budget.amount
            elsif budget.owner == "McKay"
                @mckay_spent += budget.amount
            end
        end
        
        @ally_left = $ALLOWANCE - @ally_spent
        @mckay_left = $ALLOWANCE - @mckay_spent
        
        @ally_total = ally_allowance.amount + @ally_left
        @mckay_total= mckay_allowance.amount + @mckay_left
        
        @ally_percent  = (@ally_spent / $ALLOWANCE) * 100
        @mckay_percent = (@mckay_spent / $ALLOWANCE) * 100
        
        @display_ally = (@ally_percent > 0.0)
        @display_mckay = (@mckay_percent > 0.0)
    end
    
    def show
        @budget = Budget.find(params[:id])
    end
    
    def new
        @budget = Budget.new
        @today  = Time.now.strftime("%Y/%m/%d")
    end
    
    def create
        params[:budget][:spent_on] = format_date(params[:budget][:spent_on])
        @budget = Budget.new(budget_param)
	
        if @budget.save
            redirect_to :action => 'home'
        else
            render :action => 'new'
        end
    end
    
    def edit
        @budget = Budget.find(params[:id])
    end
    
    def update
        @budget = Budget.find(params[:id])
	
        if @budget.update_attributes(budget_param)
            redirect_to :action => 'home'
        else
            @subjects = Subject.all
            render :action => 'edit'
        end
    end
    
    def destroy
        Budget.find(params[:id]).destroy
        redirect_to :action => 'home'
    end
    
    private
    
    def update_allowance(user)
        date = Budget.where(owner: user).order(:spent_on).first.spent_on
        cur_year = Time.now.year
        cur_month = Time.now.month
        new_allowance = 0.0
        
        until (date.year == cur_year) && (date.month == cur_month) 
            total = 0
            budgets = Budget.where(owner: user, spent_on: time_range_for(date.year, date.month))
            
            budgets.each do |budget|
                total += budget.amount
            end
            
            new_allowance += $ALLOWANCE - total
            date += 1.month
        end
        
        a = Allowance.find_by(owner: user)
        a.update_attributes(amount: new_allowance)
    end
    
    def time_range_for( year, month )
        return (Time.new(year, month) - 1.day + 23.hour + 59.minute + 59.second...Time.new(year, month) + 1.month - 1.day)
    end
    
    def format_date(string_date)
        parts = string_date.split("-")
        return Time.new(parts[0], parts[1], parts[2])
    end
    
    def budget_param
       params.require(:budget).permit(:owner, :description, :amount, :spent_on)
    end
end
