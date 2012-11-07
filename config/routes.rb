AbakNew::Application.routes.draw do

  match 'add'          => 'wiki#edit', :defaults => {:path => 'home'}
  match '*path/add'    => 'wiki#add'
  match '*path/edit'   => 'wiki#edit'
  match '*path/update' => 'wiki#update'
  match '*path/create' => 'wiki#create'
  match '*path/delete' => 'wiki#delete'
  match '*path'        => 'wiki#show'
  match ''             => 'wiki#show', :defaults => {:path => 'home'}

end
