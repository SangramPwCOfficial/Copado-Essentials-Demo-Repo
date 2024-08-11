public with sharing class DML_UPSERT {
    public static void myMethods() {

        // Need to update the names of the products that you already have and also need to add some new products.
        // Every year the company updates the product names with the current year

        // Getting the list of product already present in Database
        List<Product2> prodList = [SELECT Id, Name FROM Product2];
        // System.debug(prodList);

        // Getting the current year's last 2 digits in string
        Integer year = Date.today().year();
        String currYear = String.valueof(year).right(2);
        // System.debug(lastTwo);
        
        // Creating New Products
        Product2 product1 = new Product2(Name = 'Ramsung LED TV', ProductCode = '2YF39', IsActive = true, Description = 'Only Available at GADA Electronics');
        Product2 product2 = new Product2(Name = 'Ramsung Mobile', ProductCode = '2TM56', IsActive = true, Description = 'Only Available at GADA Electronics');
        Product2 product3 = new Product2(Name = 'Red Chilli 2891', ProductCode = '2PF29', IsActive = true, Description = 'Only Available at GADA Electronics');
        Product2 product4 = new Product2(Name = 'Radio Mirchi 090P', ProductCode = '2QB22', IsActive = true, Description = 'Only Available at GADA Electronics');
        Product2 product5 = new Product2(Name = 'Speaker Box', ProductCode = '2OP34', IsActive = true, Description = 'Only Available at GADA Electronics');

        // Adding to Product List
        prodList.add(product1);
        prodList.add(product2);
        prodList.add(product3);
        prodList.add(product4);
        prodList.add(product5);

        // Updating the Names of the Product
        for (Product2 pro : prodList) {
            pro.Name += '_'+currYear;
        }

        Upsert prodList;

    }
}