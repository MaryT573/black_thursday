## Black Thursday

Find the [project spec here](http://backend.turing.io/module1/projects/black_thursday/).

Black Thursday Group Members: Mary, Nikky, Mike, Parker, John

**Blog Post-Untested Methods (Iteration 4-Black Thursday)**

The two methods **most_sold_item_for_merchant(merchant_id)**

and **best_item_for_merchant(merchant_id)** are not tested by the spec harness but we will explain how each method works below.

**#1-most_sold_item_for_merchant(merchant_id)**
```
def most_sold_item_for_merchant(m_id)
most_items = []
items_from_M = @items.find_all_by_merchant_id(m_id)
items_i = items_from_M.flat_map do | item |
@invoice_items.find_all_by_item_id(item.id)
end
most_items << items_i.max {|item| item.quantity}
end
```
The **most_sold_item_for_merchant(merchant_id)** method looks at which item(per merchant) had the highest number sold. 

A local variable named **items_from_M** receives the results of a method(find_all_by_merchant_id) which is then called on **all items**.

A new local variable named **items_i** is then created and set equal to **items_from_M**, which is then flat_mapped to **all invoiced_items**.

Lastly, the **most_items** array, which is currently blank receives the **max item quantity** which is implicitly returned.
