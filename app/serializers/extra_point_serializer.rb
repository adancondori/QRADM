class ExtraPointSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :amount, :my_extrapoint

    def my_extrapoint
        code = @instance_options[:code]
        my_activity = GroupExtraPoint.includes(:group).where("groups.code = '#{code}' and group_id = groups.id and extra_point_id = #{object.id}").references(:group).first
    end
end