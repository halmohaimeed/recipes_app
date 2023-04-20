class RecipesResponse {
  int? count;
  List<Results>? results;

  RecipesResponse({this.count, this.results});

  RecipesResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  bool? isOneTop;
  int? cookTimeMinutes;
  String? promotion;
  String? keywords;
  Show? show;
  String? servingsNounPlural;
  String? canonicalId;
  int? showId;
  String? draftStatus;
  List<Sections>? sections;
  List<Tags>? tags;
  String? thumbnailAltText;
  List<Credits>? credits;
  List<Topics>? topics;
  String? slug;
  String? servingsNounSingular;
  String? videoUrl;
  int? prepTimeMinutes;
  String? name;
  int? buzzId;
  String? thumbnailUrl;
  bool? isShoppable;
  int? videoId;
  List<Compilations>? compilations;
  int? numServings;
  Brand? brand;
  Nutrition? nutrition;
  bool? tipsAndRatingsEnabled;
  String? videoAdContent;
  String? seoTitle;
  String? country;
  List<Instructions>? instructions;
  String? language;
  int? brandId;
  String? aspectRatio;
  String? description;
  String? inspiredByUrl;
  int? totalTimeMinutes;
  String? nutritionVisibility;
  List<dynamic>? facebookPosts;
  String? beautyUrl;
  TotalTimeTier? totalTimeTier;
  String? yields;
  String? originalVideoUrl;
  int? updatedAt;
  List<Renditions>? renditions;
  int? createdAt;
  int? approvedAt;
  UserRatings? userRatings;
  int? id;

  Results(
      {this.isOneTop,
      this.cookTimeMinutes,
      this.promotion,
      this.keywords,
      this.show,
      this.servingsNounPlural,
      this.canonicalId,
      this.showId,
      this.draftStatus,
      this.sections,
      this.tags,
      this.thumbnailAltText,
      this.credits,
      this.topics,
      this.slug,
      this.servingsNounSingular,
      this.videoUrl,
      this.prepTimeMinutes,
      this.name,
      this.buzzId,
      this.thumbnailUrl,
      this.isShoppable,
      this.videoId,
      this.compilations,
      this.numServings,
      this.brand,
      this.nutrition,
      this.tipsAndRatingsEnabled,
      this.videoAdContent,
      this.seoTitle,
      this.country,
      this.instructions,
      this.language,
      this.brandId,
      this.aspectRatio,
      this.description,
      this.inspiredByUrl,
      this.totalTimeMinutes,
      this.nutritionVisibility,
      this.facebookPosts,
      this.beautyUrl,
      this.totalTimeTier,
      this.yields,
      this.originalVideoUrl,
      this.updatedAt,
      this.renditions,
      this.createdAt,
      this.approvedAt,
      this.userRatings,
      this.id});

  Results.fromJson(Map<String, dynamic> json) {
    isOneTop = json['is_one_top'];
    cookTimeMinutes = json['cook_time_minutes'];
    promotion = json['promotion'];
    keywords = json['keywords'];
    show = json['show'] != null ? new Show.fromJson(json['show']) : null;
    servingsNounPlural = json['servings_noun_plural'];
    canonicalId = json['canonical_id'];
    showId = json['show_id'];
    draftStatus = json['draft_status'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    thumbnailAltText = json['thumbnail_alt_text'];
    if (json['credits'] != null) {
      credits = <Credits>[];
      json['credits'].forEach((v) {
        credits!.add(new Credits.fromJson(v));
      });
    }
    if (json['topics'] != null) {
      topics = <Topics>[];
      json['topics'].forEach((v) {
        topics!.add(new Topics.fromJson(v));
      });
    }
    slug = json['slug'];
    servingsNounSingular = json['servings_noun_singular'];
    videoUrl = json['video_url'];
    prepTimeMinutes = json['prep_time_minutes'];
    name = json['name'];
    buzzId = json['buzz_id'];
    thumbnailUrl = json['thumbnail_url'];
    isShoppable = json['is_shoppable'];
    videoId = json['video_id'];
    if (json['compilations'] != null) {
      compilations = <Compilations>[];
      json['compilations'].forEach((v) {
        compilations!.add(new Compilations.fromJson(v));
      });
    }
    numServings = json['num_servings'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    nutrition = json['nutrition'] != null
        ? new Nutrition.fromJson(json['nutrition'])
        : null;
    tipsAndRatingsEnabled = json['tips_and_ratings_enabled'];
    videoAdContent = json['video_ad_content'];
    seoTitle = json['seo_title'];
    country = json['country'];
    if (json['instructions'] != null) {
      instructions = <Instructions>[];
      json['instructions'].forEach((v) {
        instructions!.add(new Instructions.fromJson(v));
      });
    }
    language = json['language'];
    brandId = json['brand_id'];
    aspectRatio = json['aspect_ratio'];
    description = json['description'];
    inspiredByUrl = json['inspired_by_url'];
    totalTimeMinutes = json['total_time_minutes'];
    nutritionVisibility = json['nutrition_visibility'];
    if (json['facebook_posts'] != null) {
      facebookPosts = <dynamic>[];
      json['facebook_posts'].forEach((v) {
        facebookPosts!.add(v);
      });
    }
    beautyUrl = json['beauty_url'];
    totalTimeTier = json['total_time_tier'] != null
        ? new TotalTimeTier.fromJson(json['total_time_tier'])
        : null;
    yields = json['yields'];
    originalVideoUrl = json['original_video_url'];
    updatedAt = json['updated_at'];
    if (json['renditions'] != null) {
      renditions = <Renditions>[];
      json['renditions'].forEach((v) {
        renditions!.add(new Renditions.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    approvedAt = json['approved_at'];
    userRatings = json['user_ratings'] != null
        ? new UserRatings.fromJson(json['user_ratings'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_one_top'] = this.isOneTop;
    data['cook_time_minutes'] = this.cookTimeMinutes;
    data['promotion'] = this.promotion;
    data['keywords'] = this.keywords;
    if (this.show != null) {
      data['show'] = this.show!.toJson();
    }
    data['servings_noun_plural'] = this.servingsNounPlural;
    data['canonical_id'] = this.canonicalId;
    data['show_id'] = this.showId;
    data['draft_status'] = this.draftStatus;
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    data['thumbnail_alt_text'] = this.thumbnailAltText;
    if (this.credits != null) {
      data['credits'] = this.credits!.map((v) => v.toJson()).toList();
    }
    if (this.topics != null) {
      data['topics'] = this.topics!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['servings_noun_singular'] = this.servingsNounSingular;
    data['video_url'] = this.videoUrl;
    data['prep_time_minutes'] = this.prepTimeMinutes;
    data['name'] = this.name;
    data['buzz_id'] = this.buzzId;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['is_shoppable'] = this.isShoppable;
    data['video_id'] = this.videoId;
    if (this.compilations != null) {
      data['compilations'] = this.compilations!.map((v) => v.toJson()).toList();
    }
    data['num_servings'] = this.numServings;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.nutrition != null) {
      data['nutrition'] = this.nutrition!.toJson();
    }
    data['tips_and_ratings_enabled'] = this.tipsAndRatingsEnabled;
    data['video_ad_content'] = this.videoAdContent;
    data['seo_title'] = this.seoTitle;
    data['country'] = this.country;
    if (this.instructions != null) {
      data['instructions'] = this.instructions!.map((v) => v.toJson()).toList();
    }
    data['language'] = this.language;
    data['brand_id'] = this.brandId;
    data['aspect_ratio'] = this.aspectRatio;
    data['description'] = this.description;
    data['inspired_by_url'] = this.inspiredByUrl;
    data['total_time_minutes'] = this.totalTimeMinutes;
    data['nutrition_visibility'] = this.nutritionVisibility;
    if (this.facebookPosts != null) {
      data['facebook_posts'] =
          this.facebookPosts!.map((v) => v.toJson()).toList();
    }
    data['beauty_url'] = this.beautyUrl;
    if (this.totalTimeTier != null) {
      data['total_time_tier'] = this.totalTimeTier!.toJson();
    }
    data['yields'] = this.yields;
    data['original_video_url'] = this.originalVideoUrl;
    data['updated_at'] = this.updatedAt;
    if (this.renditions != null) {
      data['renditions'] = this.renditions!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['approved_at'] = this.approvedAt;
    if (this.userRatings != null) {
      data['user_ratings'] = this.userRatings!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Show {
  String? name;
  int? id;

  Show({this.name, this.id});

  Show.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Sections {
  int? position;
  List<Components>? components;
  String? name;

  Sections({this.position, this.components, this.name});

  Sections.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components!.add(new Components.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    if (this.components != null) {
      data['components'] = this.components!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    return data;
  }
}

class Components {
  String? rawText;
  String? extraComment;
  Ingredient? ingredient;
  int? id;
  int? position;
  List<Measurements>? measurements;

  Components(
      {this.rawText,
      this.extraComment,
      this.ingredient,
      this.id,
      this.position,
      this.measurements});

  Components.fromJson(Map<String, dynamic> json) {
    rawText = json['raw_text'];
    extraComment = json['extra_comment'];
    ingredient = json['ingredient'] != null
        ? new Ingredient.fromJson(json['ingredient'])
        : null;
    id = json['id'];
    position = json['position'];
    if (json['measurements'] != null) {
      measurements = <Measurements>[];
      json['measurements'].forEach((v) {
        measurements!.add(new Measurements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw_text'] = this.rawText;
    data['extra_comment'] = this.extraComment;
    if (this.ingredient != null) {
      data['ingredient'] = this.ingredient!.toJson();
    }
    data['id'] = this.id;
    data['position'] = this.position;
    if (this.measurements != null) {
      data['measurements'] = this.measurements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredient {
  String? displayPlural;
  int? id;
  String? displaySingular;
  int? updatedAt;
  String? name;
  int? createdAt;

  Ingredient(
      {this.displayPlural,
      this.id,
      this.displaySingular,
      this.updatedAt,
      this.name,
      this.createdAt});

  Ingredient.fromJson(Map<String, dynamic> json) {
    displayPlural = json['display_plural'];
    id = json['id'];
    displaySingular = json['display_singular'];
    updatedAt = json['updated_at'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_plural'] = this.displayPlural;
    data['id'] = this.id;
    data['display_singular'] = this.displaySingular;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Measurements {
  Unit? unit;
  String? quantity;
  int? id;

  Measurements({this.unit, this.quantity, this.id});

  Measurements.fromJson(Map<String, dynamic> json) {
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
    quantity = json['quantity'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
    data['quantity'] = this.quantity;
    data['id'] = this.id;
    return data;
  }
}

class Unit {
  String? name;
  String? displayPlural;
  String? displaySingular;
  String? abbreviation;
  String? system;

  Unit(
      {this.name,
      this.displayPlural,
      this.displaySingular,
      this.abbreviation,
      this.system});

  Unit.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayPlural = json['display_plural'];
    displaySingular = json['display_singular'];
    abbreviation = json['abbreviation'];
    system = json['system'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['display_plural'] = this.displayPlural;
    data['display_singular'] = this.displaySingular;
    data['abbreviation'] = this.abbreviation;
    data['system'] = this.system;
    return data;
  }
}

class Tags {
  String? name;
  int? id;
  String? displayName;
  String? type;

  Tags({this.name, this.id, this.displayName, this.type});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    displayName = json['display_name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['type'] = this.type;
    return data;
  }
}

class Credits {
  String? name;
  String? type;
  String? slug;
  String? imageUrl;
  int? id;

  Credits({this.name, this.type, this.slug, this.imageUrl, this.id});

  Credits.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    slug = json['slug'];
    imageUrl = json['image_url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['slug'] = this.slug;
    data['image_url'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}

class Topics {
  String? name;
  String? slug;

  Topics({this.name, this.slug});

  Topics.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Compilations {
  List<dynamic>? facebookPosts;
  String? canonicalId;
  int? id;
  String? aspectRatio;
  String? keywords;
  int? createdAt;
  String? language;
  String? videoUrl;
  int? buzzId;
  int? videoId;
  List<Show>? show;
  String? name;
  String? beautyUrl;
  String? slug;
  String? promotion;
  String? country;
  bool? isShoppable;
  String? description;
  String? draftStatus;
  String? thumbnailUrl;
  String? thumbnailAltText;
  int? approvedAt;

  Compilations(
      {this.facebookPosts,
      this.canonicalId,
      this.id,
      this.aspectRatio,
      this.keywords,
      this.createdAt,
      this.language,
      this.videoUrl,
      this.buzzId,
      this.videoId,
      this.show,
      this.name,
      this.beautyUrl,
      this.slug,
      this.promotion,
      this.country,
      this.isShoppable,
      this.description,
      this.draftStatus,
      this.thumbnailUrl,
      this.thumbnailAltText,
      this.approvedAt});

  Compilations.fromJson(Map<String, dynamic> json) {
    if (json['facebook_posts'] != null) {
      facebookPosts = <Null>[];
      json['facebook_posts'].forEach((v) {
        facebookPosts!.add(v);
      });
    }
    canonicalId = json['canonical_id'];
    id = json['id'];
    aspectRatio = json['aspect_ratio'];
    keywords = json['keywords'];
    createdAt = json['created_at'];
    language = json['language'];
    videoUrl = json['video_url'];
    buzzId = json['buzz_id'];
    videoId = json['video_id'];
    if (json['show'] != null) {
      show = <Show>[];
      json['show'].forEach((v) {
        show!.add(new Show.fromJson(v));
      });
    }
    name = json['name'];
    beautyUrl = json['beauty_url'];
    slug = json['slug'];
    promotion = json['promotion'];
    country = json['country'];
    isShoppable = json['is_shoppable'];
    description = json['description'];
    draftStatus = json['draft_status'];
    thumbnailUrl = json['thumbnail_url'];
    thumbnailAltText = json['thumbnail_alt_text'];
    approvedAt = json['approved_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.facebookPosts != null) {
      data['facebook_posts'] =
          this.facebookPosts!.map((v) => v.toJson()).toList();
    }
    data['canonical_id'] = this.canonicalId;
    data['id'] = this.id;
    data['aspect_ratio'] = this.aspectRatio;
    data['keywords'] = this.keywords;
    data['created_at'] = this.createdAt;
    data['language'] = this.language;
    data['video_url'] = this.videoUrl;
    data['buzz_id'] = this.buzzId;
    data['video_id'] = this.videoId;
    if (this.show != null) {
      data['show'] = this.show!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['beauty_url'] = this.beautyUrl;
    data['slug'] = this.slug;
    data['promotion'] = this.promotion;
    data['country'] = this.country;
    data['is_shoppable'] = this.isShoppable;
    data['description'] = this.description;
    data['draft_status'] = this.draftStatus;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['thumbnail_alt_text'] = this.thumbnailAltText;
    data['approved_at'] = this.approvedAt;
    return data;
  }
}

class Brand {
  String? imageUrl;
  String? name;
  int? id;
  String? slug;

  Brand({this.imageUrl, this.name, this.id, this.slug});

  Brand.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    name = json['name'];
    id = json['id'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    data['slug'] = this.slug;
    return data;
  }
}

class Nutrition {
  int? carbohydrates;
  int? fiber;
  String? updatedAt;
  int? protein;
  int? fat;
  int? calories;
  int? sugar;

  Nutrition(
      {this.carbohydrates,
      this.fiber,
      this.updatedAt,
      this.protein,
      this.fat,
      this.calories,
      this.sugar});

  Nutrition.fromJson(Map<String, dynamic> json) {
    carbohydrates = json['carbohydrates'];
    fiber = json['fiber'];
    updatedAt = json['updated_at'];
    protein = json['protein'];
    fat = json['fat'];
    calories = json['calories'];
    sugar = json['sugar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carbohydrates'] = this.carbohydrates;
    data['fiber'] = this.fiber;
    data['updated_at'] = this.updatedAt;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['calories'] = this.calories;
    data['sugar'] = this.sugar;
    return data;
  }
}

class Instructions {
  int? startTime;
  String? appliance;
  int? endTime;
  int? temperature;
  int? id;
  int? position;
  String? displayText;

  Instructions(
      {this.startTime,
      this.appliance,
      this.endTime,
      this.temperature,
      this.id,
      this.position,
      this.displayText});

  Instructions.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    appliance = json['appliance'];
    endTime = json['end_time'];
    temperature = json['temperature'];
    id = json['id'];
    position = json['position'];
    displayText = json['display_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['appliance'] = this.appliance;
    data['end_time'] = this.endTime;
    data['temperature'] = this.temperature;
    data['id'] = this.id;
    data['position'] = this.position;
    data['display_text'] = this.displayText;
    return data;
  }
}

class TotalTimeTier {
  String? tier;
  String? displayTier;

  TotalTimeTier({this.tier, this.displayTier});

  TotalTimeTier.fromJson(Map<String, dynamic> json) {
    tier = json['tier'];
    displayTier = json['display_tier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tier'] = this.tier;
    data['display_tier'] = this.displayTier;
    return data;
  }
}

class Renditions {
  String? container;
  String? url;
  int? duration;
  int? bitRate;
  int? width;
  int? height;
  String? posterUrl;
  int? fileSize;
  String? contentType;
  String? aspect;
  int? minimumBitRate;
  String? name;
  int? maximumBitRate;

  Renditions(
      {this.container,
      this.url,
      this.duration,
      this.bitRate,
      this.width,
      this.height,
      this.posterUrl,
      this.fileSize,
      this.contentType,
      this.aspect,
      this.minimumBitRate,
      this.name,
      this.maximumBitRate});

  Renditions.fromJson(Map<String, dynamic> json) {
    container = json['container'];
    url = json['url'];
    duration = json['duration'];
    bitRate = json['bit_rate'];
    width = json['width'];
    height = json['height'];
    posterUrl = json['poster_url'];
    fileSize = json['file_size'];
    contentType = json['content_type'];
    aspect = json['aspect'];
    minimumBitRate = json['minimum_bit_rate'];
    name = json['name'];
    maximumBitRate = json['maximum_bit_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['container'] = this.container;
    data['url'] = this.url;
    data['duration'] = this.duration;
    data['bit_rate'] = this.bitRate;
    data['width'] = this.width;
    data['height'] = this.height;
    data['poster_url'] = this.posterUrl;
    data['file_size'] = this.fileSize;
    data['content_type'] = this.contentType;
    data['aspect'] = this.aspect;
    data['minimum_bit_rate'] = this.minimumBitRate;
    data['name'] = this.name;
    data['maximum_bit_rate'] = this.maximumBitRate;
    return data;
  }
}

class UserRatings {
  int? countNegative;
  int? countPositive;
  num? score;

  UserRatings({this.countNegative, this.countPositive, this.score});

  UserRatings.fromJson(Map<String, dynamic> json) {
    countNegative = json['count_negative'];
    countPositive = json['count_positive'];
    score = json['score'] as num?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_negative'] = this.countNegative;
    data['count_positive'] = this.countPositive;
    data['score'] = this.score;
    return data;
  }
}
