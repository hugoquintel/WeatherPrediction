import 'content.dart';

class Prediction {
	int? statusCode;
	Content? content;

	Prediction({this.statusCode, this.content});

	factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
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
