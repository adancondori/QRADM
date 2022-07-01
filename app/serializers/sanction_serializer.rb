class SanctionSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :amount, :my_sanction

    def my_sanction
        code = @instance_options[:code]
        GroupSanction.select("group_sanctions.id, group_sanctions.amount, group_sanctions.group_id, group_sanctions.sanction_id, group_sanctions.observation, group_sanctions.user_id, users.name")
                     .includes(:group, :user)
                     .where("users.id = group_sanctions.user_id and groups.code = '#{code}' and group_id = groups.id and sanction_id = #{object.id}").references(:group).first
    end
end