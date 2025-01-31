import "../shared/model.tsp";

namespace api.payments.models;

model Payment {
  id: string;
  price: string;
  currency: string;
  customerId: string;
}

// # ListPaymentsQuery
model ListPaymentsQuery {
  ...shared.QueryCollection<{ customerId: string }>
}
model ListPayments200 {
  ...shared.ResponseCollection<Payment>
}