import "@typespec/http";
import "./model.tsp";

using TypeSpec.Http;

namespace api.customers;

@tag("Customer")
@route("/customers")
interface Customers {
  @get
  @doc("List all customers")
  listCustomers(@query query?: models.ListCustomersQuery): models.ListCustomers200;

  @get
  @doc("Get a customer by ID")
  getCustomer(@path id: string): models.GetCustomer200;

  @post
  @doc("Create a new customer")
  createCustomer(@body customer: models.CreateCustomer): models.CreateCustomer201 | models.CreateCustomer422;

  @put
  @doc("Update a customer by ID")
  updateCustomer(@path id: string, @body customer: models.UpdateCustomer): models.UpdateCustomers200;

  @delete
  @doc("Delete a customer by ID")
  deleteCustomer(@path id: string): shared.ResponseDeleted;
}