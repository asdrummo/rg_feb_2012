module AccessoriesHelper
  def add_photo(form_builder)
    link_to_function "add", :id  => "add_photo" do |page|
      form_builder.fields_for :photos, Photo.new, :child_index => 'NEW_RECORD' do |photo_form|
        html = render(:partial => 'accessories/photo', :locals => { :f => photo_form })
        page << "$('add_photo').insert({ before: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end
  
  def add_option(form_builder)
    link_to_function "add", :id  => "add_option" do |page|
      form_builder.fields_for :options, Option.new, :child_index => 'NEW_RECORD' do |option_form|
        html = render(:partial => 'accessories/option', :locals => { :f => option_form })
        page << "$('add_option').insert({ before: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end
  
  def delete_photo(form_builder)
    if form_builder.object.new_record?
      link_to_function("Remove this Photo", "this.up('fieldset').remove()")
    else
      form_builder.hidden_field(:_destroy) +
      link_to_function("Remove this Photo", "this.up('fieldset').hide(); $(this).previous().value = '1'")
    end
  end
  
  def delete_option(form_builder)
    if form_builder.object.new_record?
      link_to_function("Remove this Option", "this.up('fieldset').remove()")
    else
      form_builder.hidden_field(:_destroy) +
      link_to_function("Remove this Option", "this.up('fieldset').hide(); $(this).previous().value = '1'")
    end
  end
end
