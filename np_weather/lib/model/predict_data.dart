class PredictionData {
	int? statusCode;
	Content? content;

	PredictionData({this.statusCode, this.content});

	factory PredictionData.fromJson(Map<String, dynamic> json) => PredictionData(
				statusCode: json['status_code'] as int?,
				content: json['content'] == null
						? null
						: Content.fromJson(json['content'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'status_code': statusCode,
				'content': content?.toJson(),
			};
    
}

class Content {
	String? weatherCondition;

	Content({this.weatherCondition});

	factory Content.fromJson(Map<String, dynamic> json) => Content(
				weatherCondition: json['weather_condition'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'weather_condition': weatherCondition,
			};
}
