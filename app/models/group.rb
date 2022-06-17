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
end
