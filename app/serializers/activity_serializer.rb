class ActivitySerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :rules, :code, :date_init, :date_end, :amount, :is_closed, :state, :is_visible, :my_activity

    def is_closed
        object.is_close ? 1 : 0
    end

    def state
        object.state ? 1 : 0
    end

    def is_visible
        object.is_visible ? 1 : 0
    end

    def my_activity
        code = @instance_options[:code]
        GroupActivity.select("group_activities.id, group_activities.amount, group_activities.group_id, group_activities.activity_id, group_activities.observation, group_activities.user_id, users.name")
                     .includes(:group, :user)
                     .where("users.id = group_activities.user_id  and groups.code = '#{code}' and group_id = groups.id and activity_id = #{object.id}").references(:group).first
    end
end