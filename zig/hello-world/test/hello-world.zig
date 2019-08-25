const std = @import("std");
const testing = std.testing;

const hello_world = @import("../src/main.zig");

test "says hello" {
    testing.expect(std.mem.eql(u8, hello_world.hello(), "Hello, World!"));
}
