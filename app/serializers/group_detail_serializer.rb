class GroupDetailSerializer < ActiveModel::Serializer
    attributes :id, :name, :code, :state, :description, :total_activity, :total_sanction, :total_extra_point, :sum_total, :activities, :sanctions, :extra_points

    def total_activity
        object.sum_group_activities(true)
    end

    def total_sanction
        object.sum_group_sanctions(true) * -1
    end

    def total_extra_point
        object.sum_group_extra_points(true)
    end

    def sum_total
        object.sum_total(true)
    end

    def activities
        code = object.code
        GroupActivity.joins(:activity,:group)
                    .select(" group_activities.id AS id,
                        groups.id AS group_id,
                        activities.id AS action_id,
                        activities.amount AS action_amount,
                        activities.name AS action_name,
                        group_activities.amount AS my_amount,
                        group_activities.observation AS my_observation")
                     .where("groups.code = '#{code}' and activities.is_visible = true")
                     
    end

    def sanctions
        code = object.code
        GroupSanction.joins(:sanction,:group)
            .select(" group_sanctions.id AS id, 
                groups.id AS group_id,
                sanctions.id AS action_id,
                sanctions.amount AS action_amount,
                sanctions.name AS action_name,
                group_sanctions.amount AS my_amount,
                group_sanctions.observation AS my_observation")
            .where("groups.code = '#{code}'")
    end

    def extra_points
        code = object.code
        # GroupExtraPoint.includes(:group).where("groups.code = '#{code}' and group_id = groups.id").references(:group)
        GroupExtraPoint.joins(:extra_point,:group)
            .select(" group_extra_points.id AS id, 
                groups.id AS group_id,
                extra_points.id AS action_id,
                extra_points.amount AS action_amount,
                extra_points.name AS action_name,
                group_extra_points.amount AS my_amount,
                group_extra_points.observation AS my_observation")
            .where("groups.code = '#{code}'")
    end

end