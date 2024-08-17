import 'package:flutter/material.dart';
import 'package:flutter_lagu_daerah/models/hoyovers.dart';

class DetailPage extends StatefulWidget {
  final Hoyovers hoyovers;
  const DetailPage({
    super.key,
    required this.hoyovers,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color((0xFFf7fff7)),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color((0xFF1A535C)),
        title: Text(
          widget.hoyovers.judulLagu,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        elevation: 4,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            widget.hoyovers.judulLagu,
            style: const TextStyle(
              fontSize: 26, 
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center ,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${widget.hoyovers.penyanyi} - ${widget.hoyovers.album}',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          Image.network(
            widget.hoyovers.foto,
            height: 200,
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFe1e5f2),
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Text(
              widget.hoyovers.lirikLagu,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ]
      ),
    );
  }
}