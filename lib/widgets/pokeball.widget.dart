import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/providers/pokemon-storage-system.dart';
import 'package:provider/provider.dart';

class Pokeball extends StatelessWidget {
  final Pokemon pokemon;

  Pokeball(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonStorageSystem>(
      builder: (context, storageSystem, _) {
        final caught = storageSystem.containsPokemon(pokemon);

        return Hero(
          child: CustomPaint(
            painter: PokeballPainter(caught: caught),
            child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: pokemon.image,
            ),
          ),
          tag: pokemon.number,
        );
      },
    );
  }
}

class PokeballPainter extends CustomPainter {
  final bool caught;

  PokeballPainter({this.caught});

  @override
  void paint(Canvas canvas, Size size) {
    if (caught) {
      _drawTopHalf(canvas, size);
      _drawBottomHalf(canvas, size);
      _drawOutline(canvas, size);
      _drawCenterLine(canvas, size);
      _drawButton(canvas, size);
      _drawButtonOutline(canvas, size);
    } else {
      _drawEmpty(canvas, size);
    }
  }

  @override
  bool shouldRepaint(PokeballPainter oldPainter) {
    return oldPainter.caught != caught;
  }

  _drawEmpty(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.blueGrey;
    paint.isAntiAlias = true;

    canvas.drawArc(
      Rect.fromCircle(center: _getCenter(size), radius: _getRadius(size)),
      0,
      2 * math.pi,
      false,
      paint,
    );
  }

  _drawBottomHalf(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.isAntiAlias = true;

    canvas.drawArc(
      Rect.fromCircle(center: _getCenter(size), radius: _getRadius(size)),
      0,
      math.pi,
      false,
      paint,
    );
  }

  _drawTopHalf(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.red;
    paint.isAntiAlias = true;

    canvas.drawArc(
      Rect.fromCircle(center: _getCenter(size), radius: _getRadius(size)),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  _drawOutline(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black;
    paint.isAntiAlias = true;
    paint.strokeWidth = _getOutlineWidth(size);
    paint.style = PaintingStyle.stroke;

    final radius = _getRadius(size) - paint.strokeWidth / 2;

    canvas.drawCircle(_getCenter(size), radius, paint);
  }

  _drawCenterLine(Canvas canvas, Size size) {
    final radius = _getRadius(size);

    final paint = Paint();
    paint.isAntiAlias = true;
    paint.color = Colors.black;
    paint.strokeWidth = _getOutlineWidth(size);

    canvas.drawLine(
      Offset(size.width / 2 - radius + paint.strokeWidth, size.height / 2),
      Offset(size.width / 2 + radius - paint.strokeWidth, size.height / 2),
      paint,
    );
  }

  _drawButton(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.isAntiAlias = true;

    canvas.drawArc(
      Rect.fromCircle(center: _getCenter(size), radius: _getButtonRadius(size)),
      0,
      2 * math.pi,
      false,
      paint,
    );
  }

  _drawButtonOutline(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black;
    paint.isAntiAlias = true;
    paint.strokeWidth = _getOutlineWidth(size);
    paint.style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: _getCenter(size), radius: _getButtonRadius(size)),
      0,
      2 * math.pi,
      false,
      paint,
    );
  }

  _getCenter(Size size) {
    return Offset(size.width / 2, size.height / 2);
  }

  _getOutlineWidth(Size size) {
    return _getRadius(size) / 10;
  }

  _getRadius(Size size) {
    return size.height / 2;
  }

  _getButtonRadius(Size size) {
    return _getRadius(size) / 5;
  }
}
