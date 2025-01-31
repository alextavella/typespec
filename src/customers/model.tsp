import "../shared/model.tsp";

namespace api.customers.models;

model Customer {
  id: string;
  name: string;
  email: string;
  phone: string;
  address: string;
  address2: string;
  city: string;
  state: string;
  country: string;
  zipcode: string;
}

// # CreateCustomer
model CreateCustomer extends OmitProperties<Customer, "id"> {}
model CreateCustomer201 {
  ...shared.ResponseCreated<Customer>
}
model CreateCustomer422 {
  ...shared.ResponseValidation
}

// # UpdateCustomer
model UpdateCustomer extends OmitProperties<Customer, "id"> {}
model UpdateCustomers200 {
 ...shared.ResponseUpdated<Customer>
}

// # ListCustomersQuery
model ListCustomersQuery {
  ...shared.QueryCollection<{ name: string }>
}
model ListCustomers200 {
  ...shared.ResponseCollection<models.Customer>
}

// # GetCustomer
model GetCustomer200 {
  ...Customer
}