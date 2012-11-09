##
# All Wiki magic happens here
class WikiController < ApplicationController

  ##
  # Show add form
  # Parent ID figured out from route
  def add
    @parent = Page.find_by_path(Array(params[:path].split '/'))
    @page = Page.new(:parent_id => params[:parent_id])
  end

  ##
  # Edit an existing page
  def edit
    if params[:path] == 'home'
      @page = Page.find_or_create_by_path(['home'])
    else
      @page = Page.find_by_path params[:path].split '/'
      @parent = Page.find_or_create_by_path params[:path].split '/'
    end
  end

  ##
  # POST from #add comes here
  def create
    @page = Page.new(params[:page])

    path = []
    parent_id = nil
    params[:path].split('/').each do |path_part|
      path.push path_part
      if Page.find_by_path(path).is_a? NilClass
        p = Page.new(:slug => path_part, :title => path_part, :parent_id => parent_id)
        p.save
        parent_id = p.id
      end
    end

    @page.parent_id = parent_id

    if @page.save
      redirect_to :action => :show, :path => @page.ancestry_path
    else
      render action: "add"
    end
  end

  ##
  # Kill a page
  def delete
    @page = Page.find_by_path(params[:path].split '/')
    @page.destroy

    redirect_to :action => :show, :path => 'home'
  end

  ##
  # Update a page
  # POST from #edit comes here
  def update
    @page = Page.find_by_path params[:path].split '/'

    if @page.update_attributes(params[:page])
      redirect_to :action => :show, :path => @page.ancestry_path#, :notice => 'Page was successfully updated'
    else
      render action: "edit"
    end
  end

  ##
  # Supplementary navigation method
  # Draws all pages' hierarchy
  def nav
    @pages = Page.all
  end

  ##
  # Shows a page matching given route
  def show
    @page = Page.find_by_path params[:path].split '/'

    # Hack-ish?
    if @page.instance_of? NilClass
      redirect_to :action => :add, :path => params[:path]
      return
    end

    @pages = @page.hash_tree
  end

end
