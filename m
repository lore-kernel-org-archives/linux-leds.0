From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 bitops] bitops: Fix UBSAN undefined behavior warning for rotation right
Date: Sun,  7 Apr 2019 12:53:25 +0000
Message-ID: <20190407125325.24440-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, idosch@mellanox.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: linux-leds@vger.kernel.org

The warning is caused by call to rorXX(), if the second parameters of
this function "shift" is zero. In such case UBSAN reports the warning
for the next expression: (word << (XX - shift), where XX is
64, 32, 16, 8 for respectively ror64, ror32, ror16, ror8.
Fix adds validation of this parameter - in case it's equal zero, no
need to rotate, just original "word" is to be returned to caller.

The UBSAN undefined behavior warning has been reported for call to
ror32():
[   11.426543] UBSAN: Undefined behaviour in ./include/linux/bitops.h:93:33
[   11.434045] shift exponent 32 is too large for 32-bit type 'unsigned int'
[   11.441647] Hardware name: Mellanox Technologies Ltd. MSN3800/VMOD0007, BIOS 5.11 01/06/2019
[   11.441650] Call Trace:
[   11.441661]  dump_stack+0x71/0xab
[   11.441668]  ubsan_epilogue+0x9/0x49
[   11.441676]  __ubsan_handle_shift_out_of_bounds+0x1ea/0x241
[   11.441683]  ? __ubsan_handle_load_invalid_value+0x137/0x137
[   11.441691]  ? __module_text_address+0x11/0x90
[   11.441697]  ? widen_string+0x27/0x140
[   11.441704]  ? regmap_readable+0x76/0xc0
[   11.441709]  ? regmap_readable+0x76/0xc0
[   11.441718]  ? mlxplat_mlxcpld_readable_reg+0x1f/0x30 [mlx_platform]
[   11.441723]  ? regmap_volatile+0x40/0xb0
[   11.441729]  ? mlxplat_mlxcpld_volatile_reg+0x1f/0x30 [mlx_platform]
[   11.441735]  ? _regmap_read+0x11c/0x210
[   11.441741]  ? __mutex_lock_slowpath+0x10/0x10
[   11.441750]  ? mlxreg_led_store_hw+0x191/0x270 [leds_mlxreg]
[   11.441756]  mlxreg_led_store_hw+0x191/0x270 [leds_mlxreg]
[   11.441764]  ? mlxreg_led_brightness_get+0x270/0x270 [leds_mlxreg]
[   11.441769]  ? del_timer+0xe0/0xe0
[   11.441776]  ? bust_spinlocks+0x90/0x90
[   11.441784]  led_blink_setup+0x47/0x1d0
[   11.441792]  timer_trig_activate+0x8f/0x175 [ledtrig_timer]
[   11.441799]  ? kvasprintf_const+0xb0/0xb0
[   11.441805]  ? led_delay_on_show+0x50/0x50 [ledtrig_timer]
[   11.441810]  ? _raw_write_lock_bh+0xe0/0xe0
[   11.441815]  ? _raw_read_lock_irqsave+0x80/0x80
[   11.441822]  led_trigger_set+0x2cf/0x4d0
[   11.441829]  ? led_trigger_show+0x1f0/0x1f0
[   11.441834]  ? __mutex_lock_slowpath+0x10/0x10
[   11.441840]  ? kernfs_get_active+0xb2/0x120
[   11.441845]  ? kernfs_get_parent+0x50/0x50
[   11.441851]  led_trigger_store+0xe7/0x130
[   11.441858]  kernfs_fop_write+0x19a/0x250
[   11.441863]  ? sysfs_kf_bin_read+0x120/0x120
[   11.441869]  vfs_write+0xf5/0x230
[   11.441875]  ksys_write+0xa1/0x120
[   11.441881]  ? __ia32_sys_read+0x50/0x50
[   11.441888]  ? __do_page_fault+0x3e4/0x640
[   11.441895]  do_syscall_64+0x73/0x160
[   11.441900]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   11.441905] RIP: 0033:0x7f955749f730
[   11.441911] Code: 73 01 c3 48 8b 0d 68 d7 2b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d d9 2f 2c 00 00 75 10 b8 01 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 7e 9b 01 00 48 89 04 24
[   11.441914] RSP: 002b:00007ffd4da04488 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[   11.441920] RAX: ffffffffffffffda RBX: 0000000000000006 RCX: 00007f955749f730
[   11.441923] RDX: 0000000000000006 RSI: 0000000001a14408 RDI: 0000000000000001
[   11.441926] RBP: 0000000001a14408 R08: 00007f955775f760 R09: 00007f9557da9b40
[   11.441929] R10: 0000000000000097 R11: 0000000000000246 R12: 0000000000000006
[   11.441932] R13: 0000000000000001 R14: 00007f955775e600 R15: 0000000000000006

Reported-by: Ido Schimmel <idosch@mellanox.com>
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 include/linux/bitops.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 602af23b98c7..02c00f3c8205 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -70,6 +70,9 @@ static inline __u64 rol64(__u64 word, unsigned int shift)
  */
 static inline __u64 ror64(__u64 word, unsigned int shift)
 {
+	if (!shift)
+		return word;
+
 	return (word >> shift) | (word << (64 - shift));
 }
 
@@ -90,6 +93,9 @@ static inline __u32 rol32(__u32 word, unsigned int shift)
  */
 static inline __u32 ror32(__u32 word, unsigned int shift)
 {
+	if (!shift)
+		return word;
+
 	return (word >> shift) | (word << (32 - shift));
 }
 
@@ -110,6 +116,9 @@ static inline __u16 rol16(__u16 word, unsigned int shift)
  */
 static inline __u16 ror16(__u16 word, unsigned int shift)
 {
+	if (!shift)
+		return word;
+
 	return (word >> shift) | (word << (16 - shift));
 }
 
@@ -130,6 +139,9 @@ static inline __u8 rol8(__u8 word, unsigned int shift)
  */
 static inline __u8 ror8(__u8 word, unsigned int shift)
 {
+	if (!shift)
+		return word;
+
 	return (word >> shift) | (word << (8 - shift));
 }
 
-- 
2.11.0
