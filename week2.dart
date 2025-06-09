void main() {
  // Sample item list with prices
  List<Map<String, dynamic>> items = [
    {'name': 'Shirt', 'price': 15.0},
    {'name': 'Socks', 'price': 5.0},
    {'name': 'Hat', 'price': 20.0},
    {'name': 'Pants', 'price': 8.0},
  ];

  // Filter items (remove items below $10)
  var filteredItems = items.where((item) => item['price'] >= 10).toList();

  // Higher-order function for applying discount
  double applyDiscount(double price, double discountPercentage) {
    return price * (1 - discountPercentage / 100);
  }

  // Apply 10% discount using higher-order function
  filteredItems = filteredItems.map((item) {
    item['price'] = applyDiscount(item['price'], 10);
    return item;
  }).toList();

  // Recursive function to calculate factorial for extra discount
  int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }

  // Calculate extra discount based on factorial of item count
  int itemCount = filteredItems.length;
  double extraDiscount = 1 / factorial(itemCount) * 100; // Convert to percentage effect
  filteredItems = filteredItems.map((item) {
    item['price'] = applyDiscount(item['price'], extraDiscount);
    return item;
  }).toList();

  // Calculate total with 5% tax
  double calculateTotal(List<Map<String, dynamic>> items, double taxRate) {
    double subtotal = items.fold(0, (sum, item) => sum + item['price']);
    return subtotal * (1 + taxRate / 100);
  }

  double total = calculateTotal(filteredItems, 5);

  // Display final prices
  print('Filtered Items:');
  filteredItems.forEach((item) {
    print('${item['name']}: \$${item['price'].toStringAsFixed(2)}');
  });
  print('Total after 5% tax: \$${total.toStringAsFixed(2)}');
}