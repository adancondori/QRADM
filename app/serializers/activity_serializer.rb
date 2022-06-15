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
        my_activity = GroupActivity.includes(:group).where("groups.code = '#{code}' and group_id = groups.id and activity_id = #{object.id}").references(:group).first
    end
end