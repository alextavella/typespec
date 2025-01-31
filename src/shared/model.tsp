import "@typespec/http";

using TypeSpec.Http;

namespace shared;

model Response<T> {
  @statusCode status: T;
}

model ResponseCreated<T> {
  ...Response<201>,
  @body data: T;
}

model ResponseUpdated<T> {
  ...Response<200>,
  @body data: T;
}

model ResponseDeleted<T = void> {
  ...Response<204>,
  @body data: T;
}

model QueryCollection<T = {}> {
  @pageIndex page?: int32;
  @pageSize limit?: int32;
  ...T;
}

model ResponseCollection<T> {
  ...Response<200>,
  @pageItems data: T[];
  meta: {
    page: int32;
    limit: int32;
    total: int32;
    _links: {
      @firstLink first: string;
      @prevLink prev: string;
      @nextLink next: string;
      @lastLink last: string;
    }
  }
}

model ResponseError<T = 400> {
  ...Response<T>,
  message: string;
}

model ResponseValidation {
  ...ResponseError<422>,
  error_details: {
    field: string;
    reason: string;
  };
}