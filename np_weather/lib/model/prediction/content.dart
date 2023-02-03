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
