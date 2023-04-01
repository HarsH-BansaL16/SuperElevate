import subprocess as sp
import pymysql
import pymysql.cursors
import maskpass
from prettytable import PrettyTable

# Defining the Colors
def prRed(skk): print("\033[91m{}\033[00m" .format(skk))
def prGreen(skk): print("\033[92m{}\033[00m" .format(skk)) 
def prYellow(skk): print("\033[93m{}\033[00m" .format(skk))
def prLightPurple(skk): print("\033[94m{}\033[00m" .format(skk))
def prPurple(skk): print("\033[95m{}\033[00m" .format(skk))
def prCyan(skk): print("\033[96m{}\033[00m" .format(skk))
def prLightGray(skk): print("\033[97m{}\033[00m" .format(skk))
def prBlack(skk): print("\033[98m{}\033[00m" .format(skk))

def AddANewProduct():
    try:
        row = {}
        prPurple("Enter New Product's details: ")
        row["ProductId"] = int(input("ProductId: "))
        row["ManufacturingDate"] = (input("ManufacturingDate in (YYYY-MM-DD): "))
        row["ExpiryDate"] = (input("ExpiryDate in (YYYY-MM-DD): "))
        row["ProductName"] = (input("ProductName: "))
        row["MaximumRetailPrice"] = float(input("MaximumRetailPrice: "))
        row["CostPrice"] = float(input("CostPrice: "))
        row["Discount"] = float(input("Discount: "))
        row["QuantityAvailableInStock"] = int(input("QuantityAvailableInStock: "))
        row["DateOfLastOrderingFromTheSupplier"] = (input("DateOfLastOrderingFromTheSupplier in (YYYY-MM-DD): "))
        row["AmountLastOrderedFromSupplier"] = int(input("AmountLastOrderedFromSupplier: "))

        query = "INSERT INTO Product(ProductId, ManufacturingDate, ExpiryDate, ProductName, MaximumRetailPrice, CostPrice, Discount,QuantityAvailableInStock,DateOfLastOrderingFromTheSupplier,AmountLastOrderedFromSupplier) VALUES('%d', '%s', '%s', '%s', '%f', '%f', '%f','%d','%s', '%d')" % (
            row["ProductId"], row["ManufacturingDate"], row["ExpiryDate"], row["ProductName"], row["MaximumRetailPrice"], row["CostPrice"],row["Discount"],row["QuantityAvailableInStock"],row["DateOfLastOrderingFromTheSupplier"],row["AmountLastOrderedFromSupplier"])

        cur.execute(query)
        conn.commit()

        prGreen("Inserted Into Database")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to insert into database")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def insert(ch):
    """
        Function that maps insert functions to option entered
    """
    if (ch == 1):
        hireAnEmployee()
    elif(ch == 2):
        addANewCustomer()
    elif(ch == 3):
        AddANewProduct()
    else:
        prRed("Error: Invalid Option")

def update(ch):
    """
        Function that maps helper functions to option entered
    """
    if (ch == 1):
        UpdateMobileEmployee()
    elif(ch == 2):
        UpdateMobileCustomer()
    elif(ch == 3):
        UpdateStock()
    else:
        prRed("Error: Invalid Option")

def UpdateStock():
    try:
        # Taking Customer Details as Input
        New_Quantity = int(input("Enter the New Quantity: "))
        ProductID = int(input("Enter the ProductID: "))
        query = "UPDATE Product SET QuantityAvailableInStock = %d  WHERE ProductId = %d" % (New_Quantity,ProductID)

        cur.execute(query)
        conn.commit()

        prGreen("Successfully Updated To Database")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Update To database")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return
    
def UpdateMobileCustomer():
    try:
        # Taking Customer Details as Input
        CustomerId = int(input("Enter CustomerId: "))
        Previous_Phone_Number = input("Enter Old Phone Number: ")
        New_Phone = input("Enter New Phone Number: ")
        assert(len(Previous_Phone_Number) == 10)
        assert(len(New_Phone) == 10)
        query = "UPDATE Customer_PhoneNo SET Phone_Number = %s WHERE CustomerID = %d AND Phone_Number = %s" % (New_Phone,CustomerId,Previous_Phone_Number)

        cur.execute(query)
        conn.commit()

        prGreen("Successfully Updated To Database")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Update To database")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def UpdateMobileEmployee():
    try:
        # Taking Employee Details as Input
        EmployeeId = int(input("Enter EmployeeId: "))
        Previous_Phone_Number = input("Enter Old Phone Number: ")
        New_Phone = input("Enter New Phone Number: ")
        assert(len(Previous_Phone_Number) == 10)
        assert(len(New_Phone) == 10)
        query = " UPDATE Employee_PhoneNo SET Phone_Number = '%s' WHERE EmployeeId = %d AND Phone_Number = '%s'"%(New_Phone,EmployeeId,Previous_Phone_Number)

        cur.execute(query)
        conn.commit()

        prGreen("Successfully Updated To Database")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Update To database")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def delete(ch):
    """
        Function that maps helper functions to option entered
    """
    if (ch == 1):
        DeleteEmployee()
    elif(ch == 2):
        DeleteProduct()
    else:
        prRed("Error: Invalid Option")

def custom_query(query):
    try:
        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        for row in output:
            for col in row:
                print(col,end='\t') 
            print()
    except:
        conn.rollback()
        prRed("Failed to Execute the Operation")
    return

def PrintTable(ch):
    if (ch == 1):
        myTable = PrettyTable(["CustomerID", "FirstName", "LastName", "Products","QuantitiesOfEachProductSold","PaymentMethod"])
        cur.execute("Select * from Cart")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 2):
        myTable = PrettyTable(["CustomerID", "FirstName", "LastName", "CartProduct"])
        cur.execute("Select * from Cart_Products")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 3):
        myTable = PrettyTable(["CustomerID", "CartQOES"])
        cur.execute("Select * from Cart_QOES")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 4):
        myTable = PrettyTable(["CategoryName", "Location"])
        cur.execute("Select * from Category")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 5):
        myTable = PrettyTable(["Category_Name", "CategoryLocation"])
        cur.execute("Select * from Category_Location")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 6):
        myTable = PrettyTable(["CustomerID", "FirstName" , "LastName" ,"ValuePointsEarnedByTheCustomer"])
        cur.execute("Select * from Customer")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 7):
        myTable = PrettyTable(["CustomerID", "Phone_Number"])
        cur.execute("Select * from Customer_PhoneNo")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 8):
        myTable = PrettyTable(["DepartmentName", "DepartmentHeadEmployeeID"])
        cur.execute("Select * from Department")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 9):
        myTable = PrettyTable(["DepartmentName", "NumberOfEmployees"])
        cur.execute("Select * from DepartmentHead")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 10):
        myTable = PrettyTable(["EmployeeId", "FirstName" , "LastName" ,"EmployeeDept","Salary","DateOfJoining","SuperviserID"])
        cur.execute("Select * from Employee")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 11):
        myTable = PrettyTable(["EmployeeId", "Phone_Number"])
        cur.execute("Select * from Employee_PhoneNo")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 12):
        myTable = PrettyTable(["ProductId", "ManufacturingDate" , "ExpiryDate" ,"ProductName","MaximumRetailPrice","CostPrice","Discount","QuantityAvailableInStock","DateOfLastOrderingFromTheSupplier","AmountLastOrderedFromSupplier"])
        cur.execute("Select * from Product")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 13):
        myTable = PrettyTable(["ProductId", "MaximumRetailPrice" , "Discount" ,"CostPrice","SellingPrice","Profit"])
        cur.execute("Select * from Product_SP")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 14):
        myTable = PrettyTable(["ProductId", "StartDate" , "EndDate" ,"HowManyAvailedTheOffer","PromoName"])
        cur.execute("Select * from Promotion")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 15):
        myTable = PrettyTable(["ProductId", "StartDate" , "EndDate" ,"FestiveOffer","DiscountPercentage"])
        cur.execute("Select * from Promotion_Festive")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 16):
        myTable = PrettyTable(["ProductId", "ProductName" , "TotalLifeTimeSales" ])
        cur.execute("Select * from Sales")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    elif (ch == 17):
        myTable = PrettyTable(["ProductId", "ProductName" , "CategoryName","CustomerID" ])
        cur.execute("Select * from BelongsTo")
        output = cur.fetchall()
        conn.commit()
        for row in output:
            myTable.add_row(row)
        print(myTable)
    return

def Functional(ch):
    """
        Function that maps helper functions to option entered
    """
    if (ch == 1):
        AllProductswithDiscount()
    elif(ch == 2):
        MaxSales()
    elif(ch == 3):
        DiscountGreaterthan()
    elif(ch == 4):
        AvgGrossMargin()
    elif(ch == 5):
        MinSaleProduct()
    elif(ch == 6):
        MaxSalesCategory()
    elif(ch == 7):
        ProductNameLike()
    elif(ch == 8):
        ProductNameStartLike()
    elif(ch == 9):
        ExpirationDateandDiscount()
    elif(ch == 10):
        ValidPromoCode()
    else:
        prRed("Error: Invalid Option")

def ValidPromoCode():
    try:
        query = " Select PromoName , CASE WHEN CURDATE() BETWEEN StartDate and  EndDate THEN 'Valid' ELSE 'Not Valid' END AS Validity From Promotion"
        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def ExpirationDateandDiscount():
    try:
        # Analysis Requirement No.1 
        query = "DROP View IF EXISTS `Expired`"
        cur.execute(query)
        conn.commit()

        query = "CREATE VIEW EXPIRED AS  SELECT ProductId, ProductName,  CASE WHEN ExpiryDate-CURDATE() < 30 THEN '20%' WHEN ExpiryDate-CURDATE() < 60 THEN '10%' ELSE '0%' END AS Discount FROM Product WHERE CURDATE() between ManufacturingDate and ExpiryDate"
        cur.execute(query)
        conn.commit()

        query = "select * from Expired"
        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def ProductNameStartLike():
    try:
        ProductName = input("Enter the Name: ")
        query = "Select ProductName from Product Where ProductName REGEXP '%s?';" % (ProductName)

        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def ProductNameLike():
    try:
        ProductName = input("Enter the Alphabet: ")
        assert(len(ProductName) == 1)
        query = "Select ProductName from Product Where ProductName REGEXP '^%s'" % (ProductName)

        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def MaxSalesCategory():
    try:
        CategoryName=input("Enter the Category Name: ")
        query = "Select SUM(TotalLifeTimeSales) FROM Sales Where ProductId IN (Select DISTINCT ProductId FROM BelongsTo Where CategoryName='%s')" % (CategoryName)

        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def MinSaleProduct():
    try:
        # Finding Product With the Minimum Sales
        query = "Select ProductName from Sales Where TotalLifeTimeSales = (Select MIN(TotalLifeTimeSales) from Sales)"

        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def AvgGrossMargin():
    try:
        discount_percentage = int(input("Enter the  Percentage: "))
        # Finding Product With the Maximum Sales
        query = "Select CategoryName FROM BelongsTo JOIN Product_SP ON BelongsTo.ProductId = Product_SP.ProductId GROUP BY CategoryName HAVING AVG(Profit) > %d" % (discount_percentage)

        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def DiscountGreaterthan():
    try:
        discount_percentage = int(input("Enter the Discount Percentage: "))
        # Finding Product With the Maximum Sales
        query = "Select ProductName FROM Product WHERE (Discount > %d) OR ProductId IN (SELECT ProductId FROM Promotion_Festive Where DiscountPercentage > %d)" % (discount_percentage,discount_percentage)

        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def MaxSales():
    try:
        # Finding Product With the Maximum Sales
        query = "Select ProductName from Sales Where TotalLifeTimeSales = (Select MAX(TotalLifeTimeSales) from Sales)"

        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def AllProductswithDiscount():
    try:
        # Finding All Products with Discount
        query = "Select ProductName FROM Product WHERE (Discount > 0) OR ProductId IN (SELECT ProductId FROM Promotion_Festive Where DiscountPercentage > 0 )"

        cur.execute(query)
        output = cur.fetchall()
        conn.commit()
        print("---------------")
        for row in output:
            for col in row:
                print(col,end = "\t")
            print()
        print("---------------")
        prGreen("Query Successfully Executed!")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Execute the Query")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def hireAnEmployee():
    try:
        # Taking Employee Details as Input
        row = {}
        prPurple("Enter New Employee's details: ")
        row["FirstName"] = (input("FirstName: "))
        row["LastName"] = (input("LastName: "))
        row["EmployeeId"] = int(input("EmployeeId: "))
        row["EmployeeDept"] = input("EmployeeDept: ")
        row["Salary"] = float(input("Salary: "))
        row["DateOfJoining"] = input("DateOfJoining (YYYY-MM-DD): ")
        row["SuperviserID"] = input("SuperviserID: ")

        query = "INSERT INTO EMPLOYEE(EmployeeId, FirstName, LastName, EmployeeDept, Salary, DateOfJoining, SuperviserID) VALUES('%d', '%s', '%s', '%s', '%f', '%s', '%s')" % (
            row["EmployeeId"], row["FirstName"], row["LastName"], row["EmployeeDept"], row["Salary"], row["DateOfJoining"],row["SuperviserID"])

        cur.execute(query)
        conn.commit()

        prGreen("Inserted Into Database")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to insert into database")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def addANewCustomer():
    try:
        # Taking Employee Details as Input
        row = {}
        prPurple("Enter New Customer's details: ")
        row["FirstName"] = (input("FirstName: "))
        row["LastName"] = (input("LastName: "))
        row["CustomerID"] = int(input("CustomerID: "))
        row["ValuePointsEarnedByTheCustomer"] = 0

        query = "INSERT INTO Customer(CustomerID, FirstName, LastName, ValuePointsEarnedByTheCustomer) VALUES('%d', '%s', '%s', '%d')" % (
            row["CustomerID"], row["FirstName"], row["LastName"], row["ValuePointsEarnedByTheCustomer"])

        cur.execute(query)
        conn.commit()

        prGreen("Inserted Into Database")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to insert into database")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def DeleteEmployee():
    try:
        # Taking Employee Details as Input
        EmployeeID = int(input("Enter the EmployeeId: "))

        query = "Delete From Employee Where EmployeeId = %d" % (EmployeeID)

        cur.execute(query)
        conn.commit()

        prGreen("Deleted From Database")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Delete From database")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

def DeleteProduct():
    try:
        # Taking Employee Details as Input
        ProductId = int(input("Enter the ProductId: "))

        query = "Delete From Product Where ProductId = %d" % (ProductId)

        cur.execute(query)
        conn.commit()

        prGreen("Deleted From Database")
        
    except Exception as e:
        conn.rollback()
        prRed("Failed to Delete From database")
        print("\033[91mError: ",end = " ")
        print(e,end="")
        print("\033[00m")
    return

# Driver Code
tmp = sp.call('clear', shell=True)
while (1):
    username = input("Username: ")
    password = maskpass.askpass(mask="*") 

    if (((username.lower() == "root") and (password == "12345678"))or True):
        conn = pymysql.connect(
            host='localhost',
            user=username,
            password=password,
            db='PP4',
        )
        tmp = sp.call('clear', shell=True)

        if conn.open:
            prGreen("Connected")
        else:
            prRed("Failed to connect")

        tmp = input("Enter any key to CONTINUE> ")

        cur = conn.cursor()
        with conn.cursor() as cur:
            while (1):
                tmp = sp.call('clear', shell=True)
                prCyan("1. Insert Operation")
                prCyan("2. Update Operation")
                prCyan("3. Delete Operation")
                prCyan("4. Functional Requirements")
                prCyan("5. Print Tables")
                prCyan("6. Custom Query")

                prPurple("0. Logout")
                ch = int(input("Enter choice> "))
                if(ch == 0):
                    conn.close()
                    exit()           
                tmp = sp.call('clear', shell=True)

                if (ch == 1):
                    prYellow("------------------------ INSERT OPERATIONS ------------------------")
                    prCyan("1. Hire A New Employee")
                    prCyan("2. Add A New Customer")
                    prCyan("3. Add A New Product")
                    prPurple("-1. Back")
                    prPurple("0. Logout")
                    ch = int(input("Enter choice> "))
                    if ch == 0:
                        conn.close()
                        exit()
                    elif ch == -1:
                        continue
                    else:
                        insert(ch)
                        tmp = input("Enter any key to CONTINUE> ")

                elif (ch == 2):
                    prYellow("------------------------ UPDATE OPERATIONS ------------------------")
                    prCyan("1. Update Mobile Number of An Employee")
                    prCyan("2. Update Mobile Number of An Customer")
                    prCyan("3. Update Stock of a Product")
                    prPurple("-1. Back")
                    prPurple("0. Logout")
                    ch = int(input("Enter choice> "))
                    if ch == 0:
                        conn.close()
                        exit()
                    elif ch == -1:
                        continue
                    else:
                        update(ch)
                        tmp = input("Enter any key to CONTINUE> ")

                elif (ch == 3):
                    prYellow("------------------------ DELETE OPERATIONS ------------------------")
                    prCyan("1. Delete Employee Details")
                    prCyan("2. Delete Product Details")
                    prPurple("-1. Back")
                    prPurple("0. Logout")
                    ch = int(input("Enter choice> "))
                    if ch == 0:
                        conn.close()
                        exit()
                    elif ch == -1:
                        continue
                    else:
                        delete(ch)
                        tmp = input("Enter any key to CONTINUE> ")
                
                elif (ch == 4):
                    prYellow("------------------------ FUNCTIONAL REQUIREMENTS ------------------------")
                    prCyan("1. Select All Products With Discount")
                    prCyan("2. Select Highest Selling Product")
                    prCyan("3. Name of All the Products with Discount Percentage Greater than....")
                    prCyan("4. Name of Category with Average Gross Margin Greater than....")
                    prCyan("5. Minimum Sale Product")
                    prCyan("6. Total Sales of a Category")
                    prCyan("7. Product Name that Start with the Specific Alphabet")
                    prCyan("8. Product Names that Contain....")
                    prCyan("9. Discount Percentage in Relation to Expiration Date....")
                    prCyan("10. Check Whether Promotion is Valid or Not...")
                    prPurple("-1. Back")
                    prPurple("0. Logout")
                    ch = int(input("Enter choice> "))
                    if ch == 0:
                        conn.close()
                        exit()
                    elif ch == -1:
                        continue
                    else:
                        Functional(ch)
                        tmp = input("Enter any key to CONTINUE> ")
                
                elif (ch == 5):
                    prYellow("------------------------ Print Tables ------------------------")
                    prCyan("1. Cart")
                    prCyan("2. Cart_Products")
                    prCyan("3. Cart_QOES")
                    prCyan("4. Category")
                    prCyan("5. Category_Location")
                    prCyan("6. Customer")
                    prCyan("7. Customer_PhoneNo")
                    prCyan("8. Department")
                    prCyan("9. DepartmentHead")
                    prCyan("10. Employee")
                    prCyan("11. Employee_PhoneNo")
                    prCyan("12. Product")
                    prCyan("13. Product_SP")
                    prCyan("14. Promotion")
                    prCyan("15. Promotion_Festive")
                    prCyan("16. Sales")
                    prCyan("17. BelongsTo")
                    prPurple("-1. Back")
                    prPurple("0. Logout")
                    ch = int(input("Enter choice> "))
                    if ch == 0:
                        conn.close()
                        exit()
                    elif ch == -1:
                        continue
                    else:
                        PrintTable(ch)
                        tmp = input("Enter any key to CONTINUE> ")
                    
                elif (ch == 6):
                    prYellow("------------------------ CUSTOM OPERATIONS ------------------------")
                    query = input("Enter the Query> ")
                    custom_query(query)
                    tmp = input("Enter any key to CONTINUE> ")

                else:
                    prRed("Error: Invalid Option")
    else:
        prRed("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        print("")
