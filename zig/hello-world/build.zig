const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    var test_exe = b.addTest("test/hello-world.zig");
    test_exe.setMainPkgPath(".");

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&test_exe.step);
}
