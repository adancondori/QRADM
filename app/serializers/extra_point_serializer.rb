class ExtraPointSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :code, :amount, :event_id, :my_extrapoint


    def my_extrapoint
        code = @instance_options[:code]
        GroupExtraPoint.includes(:group).where("groups.code = '#{code}' and group_id = groups.id and extra_point_id = #{object.id}").references(:group).first
    end
end