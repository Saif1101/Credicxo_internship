import 'package:equatable/equatable.dart'; 

class TrackModel extends Equatable {
  int? trackId;
  String? trackName;
  List<String>? trackNameTranslationList;
  int? trackRating;
  int? commontrackId;
  int? instrumental;
  int? explicit;
  int? hasLyrics;
  int? hasSubtitles;
  int? hasRichsync;
  int? numFavourite;
  int? albumId;
  String? albumName;
  int? artistId;
  String? artistName;
  String? trackShareUrl;
  String? trackEditUrl;
  int? restricted;
  String? updatedTime;
  PrimaryGenres? primaryGenres;

  TrackModel(
      {this.trackId,
      this.trackName,
      this.trackNameTranslationList,
      this.trackRating,
      this.commontrackId,
      this.instrumental,
      this.explicit,
      this.hasLyrics,
      this.hasSubtitles,
      this.hasRichsync,
      this.numFavourite,
      this.albumId,
      this.albumName,
      this.artistId,
      this.artistName,
      this.trackShareUrl,
      this.trackEditUrl,
      this.restricted,
      this.updatedTime,
      this.primaryGenres});

  TrackModel.fromJson(Map<dynamic, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    if (json['track_name_translation_list'] != null) {
      trackNameTranslationList = <String>[];
      json['track_name_translation_list'].forEach((v) {
        trackNameTranslationList!.add(v.toString());
      });
    }
    trackRating = json['track_rating'];
    commontrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
    primaryGenres = json['primary_genres'] != null
        ? new PrimaryGenres.fromJson(json['primary_genres'])
        : null;
  }

  static List<TrackModel> tracksFromChart(Map<String, dynamic> json){
    List<TrackModel> tracks =[]; 
    for (int i = 0; i < json['message']['body']['track_list'].length; i++) {
      TrackModel track = TrackModel.fromJson(json['message']['body']['track_list'][i]['track']);
     
      tracks.add(track);
    }
    return tracks;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.trackId,
      this.trackName,
      this.trackNameTranslationList,
      this.trackRating,
      this.commontrackId,
      this.instrumental,
      this.explicit,
      this.hasLyrics,
      this.hasSubtitles,
      this.hasRichsync,
      this.numFavourite,
      this.albumId,
      this.albumName,
      this.artistId,
      this.artistName,
      this.trackShareUrl,
      this.trackEditUrl,
      this.restricted,
      this.updatedTime,
      this.primaryGenres];

  @override
 
  bool? get stringify => true;

}

class PrimaryGenres {
  List<MusicGenreList>? musicGenreList;

  PrimaryGenres({this.musicGenreList});

  PrimaryGenres.fromJson(Map<String, dynamic> json) {
    if (json['music_genre_list'] != null) {
      musicGenreList = <MusicGenreList>[];
      json['music_genre_list'].forEach((v) {
        musicGenreList!.add(new MusicGenreList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.musicGenreList != null) {
      data['music_genre_list'] =
          this.musicGenreList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicGenreList {
  MusicGenre? musicGenre;

  MusicGenreList({this.musicGenre});

  MusicGenreList.fromJson(Map<String, dynamic> json) {
    musicGenre = json['music_genre'] != null
        ? new MusicGenre.fromJson(json['music_genre'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.musicGenre != null) {
      data['music_genre'] = this.musicGenre!.toJson();
    }
    return data;
  }
}

class MusicGenre {
  int? musicGenreId;
  int? musicGenreParentId;
  String? musicGenreName;
  String? musicGenreNameExtended;
  String? musicGenreVanity;

  MusicGenre(
      {this.musicGenreId,
      this.musicGenreParentId,
      this.musicGenreName,
      this.musicGenreNameExtended,
      this.musicGenreVanity});

  MusicGenre.fromJson(Map<String, dynamic> json) {
    musicGenreId = json['music_genre_id'];
    musicGenreParentId = json['music_genre_parent_id'];
    musicGenreName = json['music_genre_name'];
    musicGenreNameExtended = json['music_genre_name_extended'];
    musicGenreVanity = json['music_genre_vanity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['music_genre_id'] = this.musicGenreId;
    data['music_genre_parent_id'] = this.musicGenreParentId;
    data['music_genre_name'] = this.musicGenreName;
    data['music_genre_name_extended'] = this.musicGenreNameExtended;
    data['music_genre_vanity'] = this.musicGenreVanity;
    return data;
  }
}

