import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./src/customers/index.tsp";

@service({
  title: "API",
})
namespace api {}