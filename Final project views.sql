/* Final Project Views */
USE Examples;
GO

/*  View #1  */

-- updatable view --
CREATE VIEW CurrentProducts
AS
SELECT InvoiceID, InvoiceNumber, InvoiceTotal
FROM Invoices;
GO

--original data--
SELECT * FROM CurrentProducts;

-- updating price --

GO
UPDATE CurrentProducts
SET InvoiceTotal = 2400.00
WHERE InvoiceID=2;
GO

-- displaying new data--

SELECT * FROM CurrentProducts;


/*  View #2  */

--  creating view --
GO
CREATE VIEW CustomerOrders
AS
SELECT Customers.CustID, CustomerFirst, CustomerLast, CustPhone, InvoiceID, InvoiceNumber, InvoiceTotal
FROM Customers JOIN Invoices ON Customers.CustID = Invoices.InvoiceID;
GO

-- using the view to display the data --
SELECT * FROM CustomerOrders;

/* View #3 */

-- creating view --
GO
CREATE VIEW Overdue
AS
SELECT InvoiceID, PaymentDate, PaymentTotal FROM PaidInvoices
WHERE GETDATE()>PaymentDate AND PaymentTotal > 0;
GO

-- using the view to display the data --
SELECT * FROM Overdue;

/* View #4 */

-- creating view --
GO
CREATE VIEW CustomerContact
AS
SELECT CustomerFirst, CustomerLast, CustPhone FROM Customers;
GO

-- using the view to display the data --
SELECT * FROM CustomerContact;

