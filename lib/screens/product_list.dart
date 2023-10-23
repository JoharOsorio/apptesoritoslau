import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final _productStream = FirebaseFirestore.instance.collection('product_list').snapshots();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Productos'),
    ),
    body: StreamBuilder(
      stream: _productStream,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return const Center(
            child: Text('Error'),
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // var docs = snapshot.data!.docs;
        // return Text('${docs.length}');
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index){
            final data = snapshot.data!.docs[index];
            return ListTile(
              title: Text(data['name']),
              subtitle: Text(data['url']),
              trailing: Text(data['price'].toString()),
            );
          },
        );
      },
    )
    //obtener los productos desde firebase storage

    );
  }
}