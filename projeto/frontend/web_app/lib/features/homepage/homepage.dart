import 'package:flutter/material.dart';
import 'package:web_app/features/product_type/data/product_type_datasource.dart';
import 'package:web_app/features/shared/models/product_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Listagem de Tipos de Produtos'),
        ),
        body: FutureBuilder<List<ProductTypeModel>>(
          future: ProductTypeDataSource().fetchProductTypes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var productType = snapshot.data[index];
                  return ListTile(
                    title: Text(productType.name),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/productTypeCRUD');
            setState(() {});
          },
          tooltip: 'Novo tipo de produto',
          child: const Icon(Icons.add),
        ));
  }
}
