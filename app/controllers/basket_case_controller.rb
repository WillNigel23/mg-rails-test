class BasketCaseController < ApplicationController
  before_action :set_fruits
  before_action :set_items
  before_action :set_order

  def index; end

  def order_by_fruit
    if @order == 'asc'
      @list_items = @list_items.sort_by(&:first)
    else
      @list_items = @list_items.sort_by(&:first).reverse
    end
    render 'basket_case/index'
  end

  def order_by_amount
    if @order == 'asc'
      @list_items = @list_items.sort_by(&:last)
    else
      @list_items = @list_items.sort_by(&:last).reverse
    end
    render 'basket_case/index'
  end

  private
    def set_fruits
      @fruits = {
        oranges: 5,
        apples: 9,
        grapes: 3,
        watermelons: 2
      }
    end

    def set_items
      @list_items = @fruits
    end

    def set_order
      valid_orders = %w[asc desc]
      @order = valid_orders.include?(params[:order]) ? params[:order] : 'asc'
    end
end
