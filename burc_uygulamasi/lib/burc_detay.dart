import 'package:burc_uygulamasi/model/burc.dart';
import 'package:burc_uygulamasi/zodiac_colors_theme.dart';
import 'package:burc_uygulamasi/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({super.key, required this.secilenBurc});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  double _scrollOffset = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        ZodiacColors.getPrimaryColor(widget.secilenBurc.colorKey);
    final accentColor =
        ZodiacColors.getAccentColor(widget.secilenBurc.colorKey);
    final gradient = ZodiacColors.getGradient(widget.secilenBurc.colorKey);

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.secilenBurc.burcAdi,
        colorKey: widget.secilenBurc.colorKey,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(gradient: gradient),
                  ),
                  Transform.translate(
                    offset: Offset(0, _scrollOffset * 0.5),
                    child: Hero(
                      tag: widget.secilenBurc.burcAdi,
                      child: Image.asset(
                        "images/${widget.secilenBurc.burcBuyukResim}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    widget.secilenBurc.burcAdi,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.secilenBurc.burcTarihi,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          primaryColor.withOpacity(0.1),
                          accentColor.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: primaryColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      widget.secilenBurc.burcDetayi,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}