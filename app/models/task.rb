class Task
  include ActiveModel::Model
  attr_accessor :raw, :name, :current_step, :title, :description, :product, :subtasks, :prerequisites

  def content_for(step_name)
    if ['introduction', 'conclusion'].include? step_name
      raise "Invalid step: #{step_name}" unless raw[step_name]
      return raw[step_name]['content']
    end

    path = "#{self.class.task_content_path}/#{step_name}.md"

    raise "Invalid step: #{step_name}" unless File.exist? path
    File.read(path)
  end

  def first_step
    subtasks.first['path']
  end

  def prerequisite?
    prerequisites.pluck('path').include?(@current_step)
  end

  def next_step
    current_task_index = subtasks.pluck('path').index(@current_step)
    return nil unless current_task_index
    subtasks[current_task_index + 1]
  end

  def previous_step
    current_task_index = subtasks.pluck('path').index(@current_step)
    return nil unless current_task_index
    return nil if current_task_index <= 0
    subtasks[current_task_index - 1]
  end

  def self.load(name, current_step)
    document_path = "#{task_config_path}/#{name}.yml"
    document = File.read(document_path)
    config = YAML.safe_load(document)
    Task.new({
      raw: config,
      name: name,
      current_step: current_step,
      title: config['title'],
      description: config['description'],
      product: config['product'],
      prerequisites: load_prerequisites(config['prerequisites'], current_step),
      subtasks: load_subtasks(config['introduction'], config['prerequisites'], config['tasks'], config['conclusion'], current_step),
    })
  end

  def self.load_prerequisites(prerequisites, current_step)
    return [] unless prerequisites

    prerequisites.map do |t|
      t_path = "#{task_content_path}/#{t}.md"
      raise "Prerequisite not found: #{t}" unless File.exist? t_path
      content = File.read(t_path)
      prereq = YAML.safe_load(content)
      {
        'path' => t,
        'title' => prereq['title'],
        'description' => prereq['description'],
        'is_active' => t == current_step,
        'content' => content,
      }
    end
  end

  def self.load_subtasks(introduction, prerequisites, tasks, conclusion, current_step)
    tasks ||= []

    tasks = tasks.map do |t|
      t_path = "#{task_content_path}/#{t}.md"
      raise "Subtask not found: #{t}" unless File.exist? t_path
      subtask_config = YAML.safe_load(File.read(t_path))
      {
        'path' => t,
        'title' => subtask_config['title'],
        'description' => subtask_config['description'],
        'is_active' => t == current_step,
      }
    end

    if prerequisites
      tasks.unshift({
        'path' => 'prerequisites',
        'title' => 'Prerequisites',
        'description' => 'Everything you need to complete this task',
        'is_active' => current_step == 'prerequisites',
      })
    end

    if introduction
      tasks.unshift({
        'path' => 'introduction',
        'title' => introduction['title'],
        'description' => introduction['description'],
        'is_active' => current_step == 'introduction',
      })
    end

    if conclusion
      tasks.push({
        'path' => 'conclusion',
        'title' => conclusion['title'],
        'description' => conclusion['description'],
        'is_active' => current_step == 'conclusion',
      })
    end

    tasks
  end

  def self.task_config_path
    Pathname.new("#{Rails.root}/config/tasks")
  end

  def self.task_content_path
    Pathname.new("#{Rails.root}/_tasks")
  end
end
