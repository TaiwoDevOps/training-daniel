import 'dart:io';

import 'package:company_id_card/data/company_dto.dart';
import 'package:company_id_card/data/get_company_id_res.dart';
import 'package:dio/dio.dart';

class NetworkHandler {
  final _dio = Dio();

//This is to fetch all company's "Courses" in the database
  Future<dynamic> getCompanysData(int pageIndex) async {
    try {
      final res = await _dio.post(
        "https://vigimarket-api-dev.test.vggdev.com/api/v1/Program/GetAllCoursetype",
        data: {
          "pageIndex": pageIndex,
          "pageTotal": 0,
          "pageSize": 2147483647,
        },
      );
      if (res.statusCode == 200) {
        return CompanysData.fromJson(res.data);
      } else {
        return "Something went wrong";
      }
    } on DioError catch (e) {
      throw SocketException(e.message ?? '');
    } catch (e) {
      return '';
    }
  }

  //get company "Courses" data by ID
  Future<dynamic> getCompanyDataById(int id) async {
    try {
      final res = await _dio.get(
        "https://vigimarket-api-dev.test.vggdev.com/api/v1/Program/GetCourseTypeById/$id",
      );
      if (res.statusCode == 200) {
        return GetCompanyIdResponse.fromJson(res.data);
      } else {
        return "Something went wrong";
      }
    } on DioError catch (e) {
      throw SocketException(e.message ?? '');
    } catch (e) {
      return '';
    }
  }
}
