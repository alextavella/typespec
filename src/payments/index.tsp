import "@typespec/http";
import "./model.tsp";

using TypeSpec.Http;

namespace api.payments;

@tag("Payments")
@route("/payments")
interface Payments {
  @get
  @doc("List all payments")
  listCustomers(@query query?: models.ListPaymentsQuery): models.ListPayments200;
}