# Service Caller

### How to Use
* define service & inherit from `ServiceCaller::Base`
```ruby
class [Custom Service] < ServiceCaller::Base
  def initialize(*args)
    ...
  end

  def call
    ...
  end
end
```

* call the service
```ruby
  service = [Custom Service].call(*args)
```

* check if success
```ruby
  service.success?
  service.failed?
```

* get success result if success
```ruby
  service.result
```

* get error if failed
```ruby
  service.error
```