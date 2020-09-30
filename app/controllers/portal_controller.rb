class PortalController < ApplicationController
    def index
    end
end

# controller/action
# It is a best practice to lower the visibility of methods (with private or protected) which are not intended to be actions, like auxiliary methods or filters.
# @variable_name
# params[:parameter_name]   retrieve data (params and body)

# redirect_to @client ???
# render "new"
# methods controller_name and action_name
# Filters are methods that are run "before", "after" or "around" a controller action.

# For example, if the form contains <%= text_field_tag(:query) %>, then you would be able to get the value of this field in the controller with params[:query].
# sufix _tag is to bind do params (in the url query); without _tag is to bind to the model
#<input id="person_name" name="person[name]" type="text" value="Henry" />
#Upon form submission the value entered by the user will be stored in params[:person][:name].
#You must pass the name of an instance variable, i.e. :person or "person", not an actual instance of your model object.