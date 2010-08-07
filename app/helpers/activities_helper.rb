module ActivitiesHelper
  
  def print_pomodoris(estimated, actual)
    i = 0
    result = ''
    estimated.times do
      if i < actual
        result += image_tag 'pomodori-done.png'
      else
        result += image_tag 'pomodori-estimated.png'
      end      
      i += 1
    end
    result
  end
  
  def print_star(activity)
    if activity.today
      image_tag 'star-today.png'
    else
      image_tag 'star.png'
    end
  end
  
  def print_action(activity) 
    unless activity.completed?
      if activity.running
        image_tag 'activity-running.png'
      elsif activity.team?
        image_tag 'activity-team.png'
      else
        image_tag 'activity-individual.png'
      end
    end
  end
  
end
