-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders (OrderID, CustomerID, Date) VALUES (1, 1, '2023-01-01');

-- Start the transaction 
START TRANSACTION;
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

-- And some data should be created inside the transaction 
COMMIT; 