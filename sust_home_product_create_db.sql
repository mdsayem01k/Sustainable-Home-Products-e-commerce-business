

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(255),
    PasswordHash NVARCHAR(255),
    Phone NVARCHAR(20),
    RegistrationDate DATETIME,
    NewsletterSubscription BIT,
    LoyaltyPoints INT
);

CREATE TABLE Address (
    AddressID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    AddressLine1 NVARCHAR(255),
    AddressLine2 NVARCHAR(255),
    City NVARCHAR(100),
    StateProvince NVARCHAR(100),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(100),
    IsDefault BIT,
    AddressType NVARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE Product_Category (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName NVARCHAR(100),
    Description NVARCHAR(255),
    ParentCategoryID INT NULL,
    FOREIGN KEY (ParentCategoryID) REFERENCES Product_Category(CategoryID)
);


CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(255),
    Description NVARCHAR(MAX),
    Price DECIMAL(10, 2),
    SustainabilityInfo NVARCHAR(255),
    Materials NVARCHAR(255),
    Certifications NVARCHAR(255),
    CarbonFootprint DECIMAL(10, 2),
    CategoryID INT,
    IsFeatured BIT,
    Weight DECIMAL(10, 2),
    FOREIGN KEY (CategoryID) REFERENCES Product_Category(CategoryID)
);


CREATE TABLE Product_Image (
    ImageID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    ImageURL NVARCHAR(2083),
    AltText NVARCHAR(255),
    IsPrimary BIT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


CREATE TABLE Product_Inventory (
    InventoryID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    QuantityInStock INT,
    ReorderLevel INT,
    SKU NVARCHAR(100),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


CREATE TABLE Payment_Method (
    PaymentMethodID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    PaymentType NVARCHAR(50),
    CardLastFour NVARCHAR(4),
    ExpiryDate DATE,
    IsDefault BIT,
    BillingAddressID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BillingAddressID) REFERENCES Address(AddressID)
);


CREATE TABLE Wishlist (
    WishlistID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    WishlistName NVARCHAR(100),
    CreatedDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);




CREATE TABLE Cart (
    CartID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    CreatedDate DATETIME,
    LastUpdated DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE Cart_Item (
    CartItemID INT PRIMARY KEY IDENTITY,
    CartID INT,
    ProductID INT,
    Quantity INT,
    PriceAtAddition DECIMAL(10, 2),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


CREATE TABLE [Order] (
    OrderID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    OrderDate DATETIME,
    OrderStatus NVARCHAR(50),
    TotalAmount DECIMAL(12, 2),
    ShippingAddressID INT,
    BillingAddressID INT,
    PaymentMethodID INT,
    ShippingMethod NVARCHAR(100),
    ShippingCost DECIMAL(10, 2),
    TaxAmount DECIMAL(10, 2),
    TrackingNumber NVARCHAR(100),
    EcoPackagingOption BIT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ShippingAddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (BillingAddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (PaymentMethodID) REFERENCES Payment_Method(PaymentMethodID)
);


CREATE TABLE Order_Item (
    OrderItemID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PricePerUnit DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


CREATE TABLE Review (
    ReviewID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    CustomerID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText NVARCHAR(MAX),
    ReviewDate DATETIME,
    HelpfulVotes INT DEFAULT 0,
    ReviewStatus NVARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(100),
    PasswordHash NVARCHAR(255),
    Email NVARCHAR(255),
    Role NVARCHAR(50),
    LastLogin DATETIME
);
