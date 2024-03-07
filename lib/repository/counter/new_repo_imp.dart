// import '../../data/remote/base_api_service.dart';
// import '../../data/remote/network_api_service.dart';

// class NewsRepoImp extends NewsRepo {
//   final BaseApiService _apiService = NetworkApiService();
//   static const int _pageSize = 10;

//   //. This method read data from server
//   @override
//   Future increace() async {
//     try {
//       dynamic response = await _apiService.getAllNewsResponse(
//           ApiEndPoints().getNewsList, countryCode, newsType);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

// }
