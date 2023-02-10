pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn colorCode(colors: []const ColorBand) !isize {
    const first: isize = @enumToInt(colors[0]);
    return if (colors.len == 1) first else first * 10 + @enumToInt(colors[1]);
}
