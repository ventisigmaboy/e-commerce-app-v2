import 'package:flutter/material.dart';
import 'widgets/home_header.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/section_header.dart';
import 'widgets/banner_slider.dart';
import 'widgets/category_grid.dart';
import 'widgets/filter_chips.dart';
import 'widgets/product_grid.dart';
import 'widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample data - Replace with API data later
  final List<CategoryModel> _categories = [
    CategoryModel(icon: Icons.checkroom, label: 'Clothes', id: '1'),
    CategoryModel(icon: Icons.shopping_bag, label: 'Shoes', id: '2'),
    CategoryModel(icon: Icons.shopping_bag_outlined, label: 'Bags', id: '3'),
    CategoryModel(icon: Icons.devices, label: 'Electronics', id: '4'),
    CategoryModel(icon: Icons.watch, label: 'Watch', id: '5'),
    CategoryModel(icon: Icons.diamond, label: 'Jewelry', id: '6'),
    CategoryModel(icon: Icons.kitchen, label: 'Kitchen', id: '7'),
    CategoryModel(icon: Icons.toys, label: 'Toys', id: '8'),
  ];

  final List<ProductModel> _products = [
    ProductModel(
      id: '1',
      name: 'Snake Leather Bag',
      price: '445.00',
      rating: 4.5,
      reviews: '879',
      imageUrl: 'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=400',
    ),
    ProductModel(
      id: '2',
      name: 'Suga Leather Shoes',
      price: '375.00',
      rating: 4.7,
      reviews: '7,488',
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
    ),
    ProductModel(
      id: '3',
      name: 'Leather Casual Suit',
      price: '420.00',
      rating: 4.3,
      reviews: '4,397',
      imageUrl: 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400',
    ),
    ProductModel(
      id: '4',
      name: 'Black Leather Bag',
      price: '65.00',
      rating: 4.9,
      reviews: '1,876',
      imageUrl: 'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=400',
    ),
    ProductModel(
      id: '5',
      name: 'Airtight Microphone',
      price: '390.00',
      rating: 4.6,
      reviews: '1,653',
      imageUrl: 'https://images.unsplash.com/photo-1590602847861-f357a9332bbc?w=400',
    ),
    ProductModel(
      id: '6',
      name: 'Black Nike Shoes',
      price: '550.00',
      rating: 4.5,
      reviews: '1,734',
      imageUrl: 'https://images.unsplash.com/photo-1605348532760-6753d2c43329?w=400',
    ),
  ];

  final List<String> _filters = ['All', 'Clothes', 'Shoes', 'Bags', 'Electronics'];

  final List<Map<String, String>> _banners = [
    {
      'discount': '30%',
      'title': "Today's Special!",
      'description': 'Get discount for every order, only valid for today',
      'imageUrl': 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=400',
    },
    {
      'discount': '50%',
      'title': 'Weekend Sale!',
      'description': 'Special discount for all fashion items this weekend',
      'imageUrl': 'https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?w=400',
    },
    {
      'discount': '25%',
      'title': 'New Arrivals',
      'description': 'Check out our latest collection with amazing deals',
      'imageUrl': 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with profile
                HomeHeader(
                  greeting: 'Good Morning 👋',
                  userName: 'Andrew Ainsley',
                  onNotificationTap: () {
                    // TODO: Navigate to notifications
                  },
                  onFavoriteTap: () {
                    // TODO: Navigate to favorites
                  },
                ),
                const SizedBox(height: 20),

                // Search bar
                SearchBarWidget(
                  onSearchTap: () {
                    // TODO: Navigate to search page
                  },
                  onFilterTap: () {
                    // TODO: Show filter bottom sheet
                  },
                ),
                const SizedBox(height: 24),

                // Special Offers Section
                SectionHeader(
                  title: 'Special Offers',
                  onSeeAllTap: () {
                    // TODO: Navigate to special offers page
                  },
                ),
                const SizedBox(height: 16),
                BannerSlider(
                  banners: _banners,
                  onBannerTap: () {
                    // TODO: Navigate to offer details
                    print('Banner tapped');
                  },
                ),
                const SizedBox(height: 24),

                // Categories
                CategoryGrid(
                  categories: _categories,
                  onCategoryTap: (category) {
                    // TODO: Navigate to category products
                    print('Selected category: ${category.label}');
                  },
                ),
                const SizedBox(height: 24),

                // Most Popular Section
                SectionHeader(
                  title: 'Most Popular',
                  onSeeAllTap: () {
                    // TODO: Navigate to all products
                  },
                ),
                const SizedBox(height: 16),

                // Filter chips
                FilterChips(
                  filters: _filters,
                  onFilterSelected: (filter) {
                    // TODO: Filter products by category
                    print('Selected filter: $filter');
                  },
                ),
                const SizedBox(height: 16),

                // Product Grid
                ProductGrid(
                  products: _products,
                  onProductTap: (product) {
                    // TODO: Navigate to product details
                    print('Selected product: ${product.name}');
                  },
                  onFavoriteTap: (product) {
                    // TODO: Toggle favorite
                    print('Favorite tapped: ${product.name}');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
