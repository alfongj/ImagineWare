class CoursesController < ApplicationController
  autocomplete :courses, :title
  def index
    @pasta = params[:tag]
    if params[:tag]
      @courses = Course.tagged_with(params[:tag], :any => true)
    else
      @courses = Course.all
    end
  end

  def show
    @course = Course.find(params[:id])
    session[:course] = @course.id
  end

  def new
  end

  def create
    @course = Course.create!(params[:course])
    flash[:success] = "#{@course.title} was successfully created."
    redirect_to courses_path
  end
  
  

  #def index
  #  @all_tags = Course.all_tags
  #  @selected_tags = params[:tags] || session[:tags] || {}
  #  
  #  if @selected_tags == {}
  #    @selected_tags = Hash[@all_tags.map {|tag| [tag, tag]}]
  #  end
  #  
  #  if params[:tags] != session[:tags]
  #    session[:tags] = @selected_tags
  #    redirect_to :tags => @selected_tags and return
  #  end
  #  @courses = [Course.create!(:title => "Introduction to HTML5", :tags => "beginner", :content => "This is and HTML5 course. You must build a website from sratch")]
  #  @selected_tags.each_key do |tag|
  #    @courses.concat(Course.find_all_by_tags(tag))
  #  end 
  #end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    @course.update_attributes!(params[:course])
    flash[:notice] = "#{@course.title} was successfully updated."
    redirect_to course_path(@course)
  end
=begin
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course '#{@course.title}' deleted."
    redirect_to courses_path
  end
=end
end
