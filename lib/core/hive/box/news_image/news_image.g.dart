// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsImageAdapter extends TypeAdapter<NewsImage> {
  @override
  final int typeId = 1;

  @override
  NewsImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsImage(
      thumbnail: fields[0] as String?,
      thumbnailProxied: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsImage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.thumbnail)
      ..writeByte(1)
      ..write(obj.thumbnailProxied);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
