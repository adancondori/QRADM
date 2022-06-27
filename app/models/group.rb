class Group < ApplicationRecord
  belongs_to :event
  has_many :group_activities
  has_many :group_sanctions
  has_many :group_extra_points
  protokoll :code, :pattern => "GROUP%y%m#####"

  def sum_group_activities
    group_activities.where("group_id <= ?", self.id).sum(:amount)
  end
  def sum_group_sanctions
    group_sanctions.where("group_id <= ?", self.id).sum(:amount)
  end
  def sum_group_extra_points
    group_extra_points.where("group_id <= ?", self.id).sum(:amount)
  end

  def sum_total
    sum_group_activities - sum_group_sanctions + sum_group_extra_points
  end

  def generate_qr
    qrcode = RQRCode::QRCode.new(self.code)

    # NOTE: showing with default options specified explicitly
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 200
    )

    # IO.binwrite("/tmp/#{self.id}-qrcode.png", png.to_s)
    png
  end

  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |group|
        csv << group.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true, col_sep: ";") do |row|
      product_hash = row.to_hash
      # byebug
      # product = find_or_create_by!(name: product_hash['nombre'],
      #                              description: product_hash['region'],
      #                              code: product_hash['ci'],
      #                              state: product_hash['estado'],
      #                              event_id: product_hash['campamento'],)
      byebug
      group = Group.find_by(code: product_hash['ci'])
      group = Group.new if group == nil

      group.name = product_hash['nombre']
      group.description = product_hash['region']
      group.code = product_hash['ci']
      group.state = product_hash['estado']
      group.event_id = product_hash['campamento']
      group.save

      user = User.new
      user.name = group.name
      user.last_name = ""
      user.type_role = User.get_rol_invited
      user.phone = ""
      user.state = group.state
      user.email = product_hash['email']
      user.password = '123456'
      user.event_id = group.event_id
      user.people_id = 0

    end
  end
end
