class ExtraPointSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :code, :amount, :event_id, :my_extrapoint


    def my_extrapoint
        code = @instance_options[:code]
        GroupExtraPoint.select("group_extra_points.id, group_extra_points.amount, group_extra_points.group_id, group_extra_points.extra_point_id, group_extra_points.observation, group_extra_points.user_id, users.name")
                       .includes(:group, :user)
                       .where("users.id = group_extra_points.user_id and groups.code = '#{code}' and group_id = groups.id and extra_point_id = #{object.id}").references(:group).first
    end
end