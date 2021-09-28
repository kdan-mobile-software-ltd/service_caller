# Service Caller

## How to Use
* install gem
``` bash
gem install service_caller-1.2.0.gem
```

## Require Gem
```ruby
require 'service_caller'
```

## Support of Ruby Version

| Ruby Version | Service Caller Version |
| - | - |
| 2.6 or eariler | 1.1.0 | 
| 2.7, 3.0 later | 1.2.0 |


## Example Guide

* define service & inherit from `ServiceCaller`
  * **For ruby 2.6 or earlier** (ruby 2.7 may show deprecated warning message)
```ruby
class [Custom Service] < ServiceCaller
  def initialize(*args)
    ...
  end

  def call
    ...
  end
end
```
  * **For ruby 2.7 or ruby 3.0**
``` ruby
class [Custom Service] < ServiceCaller
  def initialize(*args, **hsh)
    ...
  end

  def call
    ...
    @result = "Your service result which you want to return"
  end
end
``` 

* call the service (**For ruby 2.6 or earlier**)
```ruby
  service = [Custom Service].call(*args)
```

* call the service (**For ruby 2.7 or ruby 3.0**)
```ruby
  service = [Custom Service].call(*args, **hsh)
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

### Examples

``` ruby
class Cal_Bmi < ServiceCaller
  def initialize(member_name='william', height: 1.55, weight: 52)
    @member_name = member_name
    @height = height
    @weight = weight
  end

  def call
    bmi = calculate_bmi
    @result = "#{@member_name}'s BMI is #{bmi}"
  end

  private

  def calculate_bmi
    (@weight / @height**2).round(2)
  end
end


# Call the BMI Service

body_insight = {height: 1.80, weight: 73}
bmi = Cal_Bmi.call('william', **body_insight)

bmi.success? # it will show the caller is success or failed
bmi.result   # it will show you => william's BMI is 22.53
```