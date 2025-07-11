import 'package:ata_mobile/DioService/dio_client.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = DioClient().dio;

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> sendOtp(String email) async {
    try {
      final response = await _dio.post('auth/sendOTP?email=$email');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> validateOTP(String email, String otp) async {
    try {
      final response = await _dio.post('auth/verifyOTP?email=$email&otp=$otp');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> changePassword(
    String email,
    String newPassword,
  ) async {
    try {
      final response = await _dio.post(
        'auth/resetPassword?email=$email&newPassword=$newPassword',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> addDepartment(
    String title,
    String description,
  ) async {
    try {
      final response = await _dio.post(
        'department/create',
        data: {'departmentName': title, 'departmentDescription': description},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getAllDepartments() async {
    try {
      final response = await _dio.get('department/all');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> updateDepartment(
    int id,
    String title,
    String description,
  ) async {
    try {
      final response = await _dio.put(
        'department/$id',
        data: {'departmentName': title, 'departmentDescription': description},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> deleteDepartment(int id) async {
    try {
      final response = await _dio.delete('department/$id');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> createUser(
    String fullName,
    String email,
    String password,
    String phoneNo,
    String address,
    String profilePic,
    String joiningDate,
    int salary,
    String designation,
    String shiftStartTime,
    String shiftEndTime,
    int departmentId,
    int officeId,
  ) async {
    try {
      final response = await _dio.post(
        'auth/register?departmentId=$departmentId&officeId=$officeId',
        data: {
          'fullName': fullName,
          'email': email,
          'password': password,
          'phoneNo': phoneNo,
          'address': address,
          'profile_pic': profilePic,
          'joiningDate': joiningDate,
          'salary': salary,
          'designation': designation,
          'shiftStartTime': shiftStartTime,
          'shiftEndTime': shiftEndTime,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> createHR(
    String fullName,
    String email,
    String password,
    String phoneNo,
    String address,
    String profilePic,
    String joiningDate,
    int salary,
    String designation,
    String shiftStartTime,
    String shiftEndTime,
    int departmentId,
    int officeId,
  ) async {
    try {
      final response = await _dio.post(
        'auth/HR/register?departmentId=$departmentId&officeId=$officeId',
        data: {
          'fullName': fullName,
          'email': email,
          'password': password,
          'phoneNo': phoneNo,
          'address': address,
          'profile_pic': profilePic,
          'joiningDate': joiningDate,
          'salary': salary,
          'designation': designation,
          'shiftStartTime': shiftStartTime,
          'shiftEndTime': shiftEndTime,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> createManager(
    String fullName,
    String email,
    String password,
    String phoneNo,
    String address,
    String profilePic,
    String joiningDate,
    int salary,
    String designation,
    String shiftStartTime,
    String shiftEndTime,
    int departmentId,
    int officeId,
  ) async {
    try {
      final response = await _dio.post(
        'auth/manager/register?departmentId=$departmentId&officeId=$officeId',
        data: {
          'fullName': fullName,
          'email': email,
          'password': password,
          'phoneNo': phoneNo,
          'address': address,
          'profile_pic': profilePic,
          'joiningDate': joiningDate,
          'salary': salary,
          'designation': designation,
          'shiftStartTime': shiftStartTime,
          'shiftEndTime': shiftEndTime,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getAllEmployees() async {
    try {
      final response = await _dio.get('employee/all');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getAllHR() async {
    try {
      final response = await _dio.get('employee/hr/all');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getAllManagers() async {
    try {
      final response = await _dio.get('employee/manager/all');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> deleteEmployee(int id) async {
    try {
      final response = await _dio.delete('employee/$id');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> updateEmployee(
    int id,
    String fullName,
    String email,
    String phoneNo,
    String address,
    String profilePic,
    String joiningDate,
    int salary,
    String designation,
    String shiftStartTime,
    String shiftEndTime,
    int departmentId,
    int officeId,
  ) async {
    try {
      final response = await _dio.put(
        'employee/$id?departmentId=$departmentId&officeId=$officeId',
        data: {
          'fullName': fullName,
          'email': email,
          'phoneNo': phoneNo,
          'address': address,
          'profile_pic': profilePic,
          'joiningDate': joiningDate,
          'salary': salary,
          'designation': designation,
          'shiftStartTime': shiftStartTime,
          'shiftEndTime': shiftEndTime,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> checkIn(int id) async {
    try {
      final response = await _dio.post('attendance/check-in/$id');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> checkOut(int id) async {
    try {
      final response = await _dio.post('attendance/check-out/$id');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getTodaysAttendance(int id) async {
    try {
      final response = await _dio.get('attendance/user/$id/today');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getMonthlyRecord(
    int id,
    int month,
    int year,
  ) async {
    try {
      final response = await _dio.get(
        'attendance/user/$id?month=$month&year=$year',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getTodayOverallAttendance() async {
    try {
      final response = await _dio.get('attendance/today/overall');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getWeekOverallAttendance() async {
    try {
      final response = await _dio.get('attendance/week/overall');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getMonthOverallAttendance(
    int month,
    int year,
  ) async {
    try {
      final response = await _dio.get(
        'attendance/month/overall?month=$month&year=$year',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getYearOverallAttendance(int year) async {
    try {
      final response = await _dio.get('attendance/year/overall?year=$year');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getAllOffices() async {
    try {
      final response = await _dio.get('office-locations/get-all');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  Future<Map<String, dynamic>> getTodayAttendanceReport() async {
    try {
      final response = await _dio.get('attendance/today/excel-report');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }

  // Add this method to your ApiService class
  Future<Map<String, dynamic>> getMonthlyAttendanceReport(
    int month,
    int year,
  ) async {
    try {
      final response = await _dio.get(
        'attendance/monthly/excel-report',
        queryParameters: {'month': month, 'year': year},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception('$errorMessage');
    }
  }
}
