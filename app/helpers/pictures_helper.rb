def choose_new_or_edit
  if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
    confirm_timelines_path
  elsif action_name == 'edit'
    timeline_path
  end
end
