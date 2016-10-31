-- make arrows and shots stack by 200
update item_template set stackable = 200 where class = 6 and subclass in (2,3) and stackable = 1000;
