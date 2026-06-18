public class LinearSearchDemo {

    public static Product linearSearch(Product[] products, int targetId) {
        for (Product product : products) {
            if (product.productId == targetId) {
                return product;
            }
        }
        return null;
    }

    public static void main(String[] args) {

        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Mobile", "Electronics"),
            new Product(103, "Shoes", "Fashion"),
            new Product(104, "Watch", "Accessories")
        };

        Product result = linearSearch(products, 103);

        if (result != null) {
            System.out.println("Product Found:");
            result.display();
        } else {
            System.out.println("Product Not Found");
        }
    }
}