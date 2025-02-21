-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

-- Get the generated Order ID
SET @OrderID = LAST_INSERT_ID();

-- Start the transaction 
START TRANSACTION;

-- Insert an order item for AwersomeProduct (ID: 1, count: 1)
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (@OrderID, 1, 1);

-- Update the warehouse stock for AwersomeProduct (ID: 1)
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

-- Commit the transaction to ensure data consistency
COMMIT;
