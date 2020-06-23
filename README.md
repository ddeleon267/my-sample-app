CRUD actions

C => Create
get /posts/new -> new action. Renders a new view       
post /posts    -> create action. Handles form data, then redirects 

R => Read
get /posts      -> index action. Renders an index view
get /posts/:id  -> show action. Renders a show view

U => Update
get /posts/:id/edit -> edit action. Renders edit view 
patch (put) /posts/:id    -> update action. Handles form data, then redirects

D => Delete
delete /posts/:id  -> delete action. Deletes resource, then redirects. (typically triggered by a button in the show and/or index view)
