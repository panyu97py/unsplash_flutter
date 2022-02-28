enum OrderBy { latest, oldest, popular }

class Pageable {
  Pageable({this.pageNum = 1, this.pageSize, this.orderBy = OrderBy.latest});

  int? pageNum;

  int? pageSize;

  OrderBy? orderBy;

  Map<String, dynamic> toMap() {
    return {"page": pageNum, "per_page": pageSize, "order_by": orderBy.toString().split('.').last};
  }
}
