class Snow {
	double? onehour;

	Snow({this.onehour});

	factory Snow.fromJson(Map<String, dynamic> json) => Snow(
				onehour: (json['onehour'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'onehour': onehour,
			};
}
