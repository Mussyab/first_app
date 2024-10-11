import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Map<String, dynamic>>[].obs;
  var length = 0;

  void fetchProducts() async {
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('data');

      // Get all the documents in the collection
      QuerySnapshot querySnapshot = await collectionRef.get();

      products.clear();
      // Iterate over the documents and print their IDs (keys)
      for (var doc in querySnapshot.docs) {
        var snapshot = await FirebaseFirestore.instance
            .collection('data')
            .doc(doc.id)
            .get();

        if (snapshot.exists && snapshot.data() != null) {
          var productData = {
            'id': doc.id, // Document ID
            'title': snapshot.data()?['title'],
            'description': snapshot.data()?['description'],
            'image_url': snapshot.data()?['image_url'],
            'price': snapshot.data()?['price'],
          };

          // Add the product data to the products list
          products.add(productData);
        } else {
          print("Document not found.");
        }
      }

      print(products.toString());
    } catch (e) {
      print("Error fetching products: $e");
    }
  }
}
