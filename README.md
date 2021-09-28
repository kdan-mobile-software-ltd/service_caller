# Service Caller

## Installation
1. Add `service_caller` in your app's `Gemfile`.

``` ruby
# ruby version is 2.7 or 3
gem 'service_caller', '~> 1.2.0'
```

2. Then, in your project directory, install the gem manually from your shell, run:

``` bash
# Download and install
$ bundle install
```

## Upgrading

If your project is already using an older version of service_caller, upgrade to the latest version with:

``` bash
$ bundle update service_caller
```

## Support of Ruby and Rails Version

|  Ruby Version  | Rails Verision | Service Caller Version |
| - | - | - |
| 2.6 or eariler | 5.x | 1.1.0 | 
| 2.7, 3.0 later | 6.x | 1.2.0 |

## Usage

* define service & inherit from `ServiceCaller`
  * **For ruby 2.6 or earlier** (ruby 2.7 may show deprecated warning message)
```ruby
class [Custom Service] < ServiceCaller
  def initialize(*args)
    ...
    @a = a
    @b = b
  end

  def call
    ...
    @result = "Your service result which you want to return"
  end
end
```
  * **For ruby 2.7 or ruby 3.0**
``` ruby
class [Custom Service] < ServiceCaller
  def initialize(*args, **hsh)
    ...
    @a = a
    @b = b
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

### Example

``` ruby
class CalBmi < ServiceCaller
  def initialize(member_name, height: 1.55, weight: 52)
    @member_name = member_name
    @height = height
    @weight = weight
  end

  def call
    bmi = calculate_bmi
    raise ServiceError.new(:member_name_not_found, error_msg: 'not enter the name') if @member_name.blank?
    @result = "#{@member_name}'s BMI is #{bmi}"
  end

  private

  def calculate_bmi
    (@weight / @height**2).round(2)
  end
end


# Call the BMI Service

body_insight = {height: 1.80, weight: 73}
bmi = CalBmi.call('william', **body_insight)

bmi.success? # it will show the caller is success or failed
bmi.result   # it will show you => william's BMI is 22.53

bmi = CalBmi.call('', **body_insight)
bmi.error    # if failed, the service will raise the custom error => #<ServiceError: member_name_not_found>
bmi.error.key # :member_name_not_found
bmi.error.error_obj #  {:error_msg=>"not enter the name"}
```