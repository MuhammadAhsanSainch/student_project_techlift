// import 'package:combined_app/model/models/student.dart';
// import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart' as aws;
// import 'package:aws_dynamodb_api/dynamodb-2011-12-05.dart';
// import 'package:aws_client/aws_client.dart';

// class DbHelper {
//   Future<void> addStudent(Student student) async {
//     // Create a DynamoDB client.
//     final client = aws.DynamoDB(region: 'us-west');

//     // Create a DynamoDB table.
//     final table = await client.createTable(
//       tableDescription: TableDescription(
//         tableArn: 'arn:aws:dynamodb:us-west-2:123456789012:table/students',
//         attributeDefinitions: [
//           aws.AttributeAction(
//             attributeName: 'id',
//             AttributeType: ScalarAttributeType.S,
//           ),
//         ],
//         keySchema: [
//           KeySchemaElement(
//             attributeName: 'id',
//             keyType: KeyType.HASH,
//           ),
//         ],
//         provisionedThroughput: ProvisionedThroughput(
//           readCapacityUnits: 1,
//           writeCapacityUnits: 1,
//         ),
//       ), attributeDefinitions: [],
//     );

//     // Add the student to the DynamoDB table.
//     await client.putItem(
//       tableName: 'students',
//       item: student.toMap(),
//     );
//   }
// }
