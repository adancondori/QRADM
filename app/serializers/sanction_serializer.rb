class SanctionSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :amount, :my_sanction

    def my_sanction
        code = @instance_options[:code]
        GroupSanction.includes(:group).where("groups.code = '#{code}' and group_id = groups.id and sanction_id = #{object.id}").references(:group).first
    end
end