if Rails.env.development?
  GrapeSwaggerRails.options.app_url = '/api/v1/'
  GrapeSwaggerRails.options.url = 'swagger_doc.json'
  GrapeSwaggerRails.options.app_name = 'RailsGrape Swagger'
  # Set docExpansion with "none" or "list" or "full", default is "none".
  GrapeSwaggerRails.options.doc_expansion = "list"
  GrapeSwaggerRails.options.supported_submit_methods = ['get']
end