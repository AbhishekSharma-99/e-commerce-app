-- Insert data into category table
INSERT INTO category (id, description, name) VALUES
    (nextval('category_seq'), 'Electronics and gadgets', 'Electronics'),
    (nextval('category_seq'), 'Home and kitchen appliances', 'Home & Kitchen'),
    (nextval('category_seq'), 'Fashion and clothing', 'Fashion'),
    (nextval('category_seq'), 'Sports and fitness gear', 'Sports'),
    (nextval('category_seq'), 'Books and stationery', 'Books');

-- Insert data into product table
INSERT INTO product (id, description, name, available_quantity, price, category_id) VALUES
    (nextval('product_seq'), 'Latest model smartphone with 128GB storage', 'Smartphone X', 100, 699.99, (SELECT id FROM category WHERE name = 'Electronics')),
    (nextval('product_seq'), 'Noise-canceling wireless headphones', 'Wireless Headphones', 50, 199.99, (SELECT id FROM category WHERE name = 'Electronics')),
    (nextval('product_seq'), 'High-performance blender for smoothies', 'Blender Pro', 30, 89.99, (SELECT id FROM category WHERE name = 'Home & Kitchen')),
    (nextval('product_seq'), 'Men''s cotton t-shirt (Pack of 3)', 'Cotton T-Shirt', 200, 29.99, (SELECT id FROM category WHERE name = 'Fashion')),
    (nextval('product_seq'), 'Adjustable dumbbells (Pair) - 10kg each', 'Dumbbells 10kg', 40, 59.99, (SELECT id FROM category WHERE name = 'Sports')),
    (nextval('product_seq'), 'Bestselling novel by a renowned author', 'Fiction Novel', 80, 14.99, (SELECT id FROM category WHERE name = 'Books')),
    (nextval('product_seq'), 'Ergonomic gaming chair with lumbar support', 'Gaming Chair', 20, 299.99, (SELECT id FROM category WHERE name = 'Electronics')),
    (nextval('product_seq'), 'Premium non-stick cookware set', 'Cookware Set', 25, 149.99, (SELECT id FROM category WHERE name = 'Home & Kitchen')),
    (nextval('product_seq'), 'Running shoes with breathable mesh design', 'Running Shoes', 60, 79.99, (SELECT id FROM category WHERE name = 'Fashion')),
    (nextval('product_seq'), 'Yoga mat with anti-slip texture', 'Yoga Mat', 100, 24.99, (SELECT id FROM category WHERE name = 'Sports'));
