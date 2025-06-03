# Sustainable Home Products E-commerce Platform

## 🌱 Project Overview

A comprehensive e-commerce platform dedicated to sustainable home products, offering eco-friendly alternatives to everyday household items. Our mission is to reduce plastic waste, promote sustainability, and support an eco-conscious lifestyle through durable, biodegradable, and reusable products.

### 🎯 Key Features
- **Eco-friendly Product Catalog**: Bamboo kitchen products, reusable food wraps, zero-waste cleaning supplies
- **Sustainability Focus**: Detailed environmental impact information for each product
- **User-friendly Shopping**: Easy browsing, filtering, and purchasing experience
- **Order Management**: Complete order tracking and management system
- **Review System**: Customer feedback and product rating functionality

## 📋 User Stories

### Customer Features
1. **Account Management**: Secure account creation with order tracking capabilities
2. **Address Management**: Multiple delivery address management
3. **Product Discovery**: Browse eco-friendly products with detailed sustainability information
4. **Category Filtering**: Filter products by categories (kitchen, cleaning, storage)
5. **Search Functionality**: Keyword-based product search
6. **Wishlist**: Save products for future purchase consideration
7. **Shopping Cart**: Add products and view updated totals
8. **Checkout Process**: Streamlined checkout with saved payment methods
9. **Order Tracking**: Real-time order status and shipping information
10. **Product Reviews**: Share feedback and experiences with products

### Admin Features
11. **Product Management**: Manage products, categories, and inventory
12. **Review Moderation**: Monitor and moderate customer reviews

## 🗂️ Database Schema

### Core Entities

#### Customer Management
- **Customer**: User account information and loyalty data
- **Address**: Multiple delivery and billing addresses per customer
- **Payment_Method**: Saved payment options with security

#### Product Catalog
- **Product_Category**: Hierarchical product categorization
- **Product**: Detailed product information including sustainability metrics
- **Product_Image**: Multiple product images with primary designation
- **Product_Inventory**: Stock management and SKU tracking

#### Shopping Experience
- **Wishlist**: Customer product wishlists
- **Wishlist_Item**: Individual wishlist entries
- **Cart**: Active shopping carts
- **Cart_Item**: Items in shopping carts with pricing

#### Order Management
- **Order**: Complete order information with eco-packaging options
- **Order_Item**: Individual order line items
- **Review**: Product reviews and ratings

#### Administration
- **Admin**: Administrative user management

### 📊 Entity Attributes

**Customer** (CustomerID, FirstName, LastName, Email, PasswordHash, Phone, RegistrationDate, NewsletterSubscription, LoyaltyPoints)

**Address** (AddressID, CustomerID, AddressLine1, AddressLine2, City, StateProvince, PostalCode, Country, IsDefault, AddressType)

**Product_Category** (CategoryID, CategoryName, Description, ParentCategoryID)

**Product** (ProductID, ProductName, Description, Price, SustainabilityInfo, Materials, Certifications, CarbonFootprint, CategoryID, IsFeatured, Weight)

**Product_Image** (ImageID, ProductID, ImageURL, AltText, IsPrimary)

**Product_Inventory** (InventoryID, ProductID, QuantityInStock, ReorderLevel, SKU)

**Payment_Method** (PaymentMethodID, CustomerID, PaymentType, CardLastFour, ExpiryDate, IsDefault, BillingAddressID)

**Wishlist** (WishlistID, CustomerID, WishlistName, CreatedDate)

**Wishlist_Item** (WishlistItemID, WishlistID, ProductID, DateAdded)

**Cart** (CartID, CustomerID, CreatedDate, LastUpdated)

**Cart_Item** (CartItemID, CartID, ProductID, Quantity, PriceAtAddition)

**Order** (OrderID, CustomerID, OrderDate, OrderStatus, TotalAmount, ShippingAddressID, BillingAddressID, PaymentMethodID, ShippingMethod, ShippingCost, TaxAmount, TrackingNumber, EcoPackagingOption)

**Order_Item** (OrderItemID, OrderID, ProductID, Quantity, PricePerUnit)

**Review** (ReviewID, ProductID, CustomerID, Rating, ReviewText, ReviewDate, HelpfulVotes, ReviewStatus)

**Admin** (AdminID, Username, PasswordHash, Email, Role, LastLogin)

## 🌿 Sustainability Features

- **Carbon Footprint Tracking**: Each product includes carbon footprint information
- **Material Transparency**: Detailed material composition for informed decisions
- **Certification Display**: Environmental certifications and standards
- **Eco-packaging Options**: Sustainable packaging choices during checkout
- **Sustainability Information**: Comprehensive environmental impact details

## 🚀 Getting Started

1. Clone the repository
2. Set up the database using the provided schema
3. Configure environment variables
4. Install dependencies
5. Run the application

## 🤝 Contributing

We welcome contributions to make this platform even more sustainable and user-friendly. Please read our contributing guidelines before submitting pull requests.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

*Building a sustainable future, one purchase at a time* 🌍
