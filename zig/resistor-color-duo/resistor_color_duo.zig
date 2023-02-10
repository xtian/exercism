pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn colorCode(colors: []const ColorBand) !isize {
    return 10 * @as(isize, @enumToInt(colors[0])) + @enumToInt(colors[1]);
}
