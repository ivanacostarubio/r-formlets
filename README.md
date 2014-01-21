# r-formlet

This is sketch to create Formlets in Ruby. 

A wicked way to create web forms. 

Example: 

```ruby
### form_form.rb

  class PersonForm
    include Formlets

    def action
      "/person"
    end

    def form_attributes
      {
        :name => :text
      }
    end
  end
  
### my_view.erb

Formlets.render(PersonForm)

```

Will render: 

```ruby
  <form action='/one_action'>
    <div class='form-name'>
      <input type='text' id='name'></input>
    </div>
  </form>
```

## Current Support

We currently support the following form attributes:

```ruby
    def form_attributes
      {
        :name => :text,
        :logo => :file,
        :long_description => :textarea
      }
    end
```

## Contributing
 
* Be awesome. Play nice.
* Go get some tests passing at: [our test suite](https://github.com/ivanacostarubio/r-formlets/blob/master/spec/r-formlet_spec.rb)

## Copyright


Copyright (c) 2014 Ivan Acosta-Rubio. SoftwareCriollo.com



