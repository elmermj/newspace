import 'package:flutter/material.dart';

class CustomListModalBottomSheet {
  final BuildContext context;
  final String title;
  final double height;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  CustomListModalBottomSheet({
    required this.context,
    required this.title,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  }){
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return Container(
          height: height,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16,),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: itemCount,
                  itemBuilder: itemBuilder
                ),
              )
            ],
          ),
        );
      }
    );
  }
}