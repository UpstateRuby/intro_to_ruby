require 'csv'
class HourLogger

  def people
    @people ||= ["john", "jane", "josh", "judd"]
  end

  def random_hours
    rand(1..8)
  end

  def tasks
    @tasks ||= ["#1", "#2", "#3", "#4", "#5", "#6", "#7", "#8", "#9", "#10"]
  end

  def random_task
    idx = rand(0..9)
    tasks[idx]
  end

  def random_person
    idx = rand(0..3)
    people[idx]
  end

  def generate_month
    CSV.open("january_2017.csv", "wb") do |csv|
      csv << ["date", "name", "task", "hours"]
      Date.new(2017, 01, 01).upto(Date.new(2017, 01, 31)).each do |date|
        5.times do
          csv << [date.strftime("%Y-%m-%d"), random_person, random_task, random_hours]
        end
      end
    end
  end
end

HourLogger.new.generate_month
