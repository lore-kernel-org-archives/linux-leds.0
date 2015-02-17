From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Tue, 17 Feb 2015 14:34:13 -0800
Message-ID: <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com> <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:41163 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754246AbbBQWee (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 17 Feb 2015 17:34:34 -0500
In-Reply-To: <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Thu, Feb 12, 2015 at 12:45 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hello Bryan
>
> On Thu, Feb 12, 2015 at 8:48 PM, Bryan Wu <cooloney@gmail.com> wrote:
>>
>> Could you please give me some real error message or example about this
>> device tree overlays? Looks like it's not only for LED subsystem and
>> how is it handled in other subsystem?
>
> In my case I have a device tree overlay describing a camera. This
> camera has 3 leds, named red, green and yellow. When I connect the
> second camera, kobject complains about a repeated name. The error is
> REALLY verbose. I am out of the office right now, so I cannot show you
> the error message. You can trigger the same error by trying to
> register two leds with the same name.
>

Can you show me your device tree code for overlaying describing a camera?

-Bryan

> A similar error can be triggered for example when we want to create
> two misc devices with the same name
>
> [106998.862865] ------------[ cut here ]------------
> [106998.862885] WARNING: CPU: 1 PID: 12979 at
> /build/linux-CMiYW9/linux-3.16.7-ckt2/fs/sysfs/dir.c:31
> sysfs_warn_dup+0x5f/0x70()
> [106998.862890] sysfs: cannot create duplicate filename
> '/devices/virtual/misc/eudyptula'
> [106998.862894] Modules linked in: hello(O+) btrfs xor raid6_pq ufs
> qnx4 hfsplus hfs minix ntfs msdos jfs xfs libcrc32c dm_mod bnep
> bluetooth 6lowpan_iphc mmc_block tun ctr ccm binfmt_misc nfsd
> auth_rpcgss oid_registry nfs_acl nfs lockd fscache sunrpc nls_utf8
> nls_cp437 vfat fat x86_pkg_temp_thermal intel_powerclamp intel_rapl
> uvcvideo coretemp videobuf2_vmalloc kvm_intel videobuf2_memops
> videobuf2_core v4l2_common videodev kvm media joydev crc32_pclmul
> ghash_clmulni_intel aesni_intel arc4 aes_x86_64 iwldvm mac80211
> iwlwifi cfg80211 lrw gf128mul glue_helper iTCO_wdt iTCO_vendor_support
> ablk_helper evdev psmouse i915 snd_hda_codec_hdmi cryptd serio_raw
> pcspkr ac shpchp efi_pstore drm_kms_helper snd_hda_codec_conexant
> snd_hda_codec_generic lpc_ich thinkpad_acpi nvram tpm_tis efivars drm
> i2c_algo_bit i2c_i801
> [106998.863005]  snd_hda_intel snd_hda_controller mfd_core mei_me
> snd_hda_codec i2c_core mei wmi snd_hwdep rfkill snd_pcm tpm battery
> snd_timer snd soundcore button video processor fuse parport_pc ppdev
> lp parport autofs4 ext4 crc16 mbcache jbd2 sg sd_mod sr_mod crc_t10dif
> cdrom crct10dif_generic crct10dif_pclmul crct10dif_common crc32c_intel
> ahci libahci libata ehci_pci ehci_hcd scsi_mod sdhci_pci sdhci
> mmc_core e1000e usbcore ptp pps_core usb_common thermal thermal_sys
> [106998.863077] CPU: 1 PID: 12979 Comm: insmod Tainted: G           O
> 3.16.0-4-amd64 #1 Debian 3.16.7-ckt2-1
> [106998.863083] Hardware name: LENOVO 4180DY4/4180DY4, BIOS 83ET76WW
> (1.46 ) 07/05/2013
> [106998.863087]  0000000000000009 ffffffff81507263 ffff880021757af8
> ffffffff81065847
> [106998.863096]  ffff880065c6d000 ffff880021757b48 ffff880214c1c820
> 0000000000000000
> [106998.863103]  0000000000000000 ffffffff810658ac ffffffff8172ff20
> ffffffff00000028
> [106998.863111] Call Trace:
> [106998.863125]  [<ffffffff81507263>] ? dump_stack+0x41/0x51
> [106998.863137]  [<ffffffff81065847>] ? warn_slowpath_common+0x77/0x90
> [106998.863145]  [<ffffffff810658ac>] ? warn_slowpath_fmt+0x4c/0x50
> [106998.863153]  [<ffffffff81212ae3>] ? kernfs_path+0x43/0x50
> [106998.863161]  [<ffffffff81215f1f>] ? sysfs_warn_dup+0x5f/0x70
> [106998.863169]  [<ffffffff81215fae>] ? sysfs_create_dir_ns+0x7e/0x90
> [106998.863180]  [<ffffffff812a9706>] ? kobject_add_internal+0xc6/0x3e0
> [106998.863190]  [<ffffffff812b0f56>] ? string.isra.7+0x36/0xe0
> [106998.863197]  [<ffffffff812a9e25>] ? kobject_add+0x65/0xb0
> [106998.863204]  [<ffffffff812b1e8e>] ? pointer.isra.18+0x9e/0x470
> [106998.863213]  [<ffffffff8139c584>] ? device_add+0x124/0x610
> [106998.863221]  [<ffffffff8139cc68>] ? device_create_groups_vargs+0xd8/0x100
> [106998.863239]  [<ffffffffa0025000>] ? 0xffffffffa0024fff
> [106998.863247]  [<ffffffff8139ccf1>] ? device_create+0x41/0x50
> [106998.863257]  [<ffffffff812b621e>] ? kasprintf+0x3e/0x40
> [106998.863268]  [<ffffffff8138c6a2>] ? misc_register+0xc2/0x120
> [106998.863277]  [<ffffffffa002500c>] ? hello_init+0xc/0x1000 [hello]
> [106998.863285]  [<ffffffff8100213c>] ? do_one_initcall+0xcc/0x200
> [106998.863295]  [<ffffffff810d8d1a>] ? load_module+0x20da/0x26b0
> [106998.863303]  [<ffffffff810d4900>] ? store_uevent+0x40/0x40
> [106998.863312]  [<ffffffff810d944d>] ? SyS_finit_module+0x7d/0xa0
> [106998.863322]  [<ffffffff8150d32d>] ? system_call_fast_compare_end+0x10/0x15
> [106998.863327] ---[ end trace af819f702b51bbb0 ]---
> [106998.863332] ------------[ cut here ]------------
>
>
>>> +static int match_child(struct device *dev, void *data)
>>> +{
>>> +       if (!dev_name(dev))
>>> +               return 0;
>>> +       return !strcmp(dev_name(dev), (char *)data);
>>
>> strncmp instead of strcmp?
>
> I dont think it would make it safer here. You need to know the size of
> the string, and finding out the lenght of the string will produce the
> same access error (if that is what concerns you).
>
>> I still think we need solve this issue in device tree core code not in
>> the user of DT.
>
> Other subsystem do not have the issue of unique naming.
>
> ie, in video4linux the device name is created dynamically (video0,
> video1.....), others like hwmon have a hierarchical name
> (hmon0/input0, hwmon1/input0)
>
> I think this is a problem related to the led subsystem that does not
> have a way to handled repeated names. Before we could blame the system
> designer for choosing the same name for two leds, but with dt overlays
> this is not more in full control of the sys designer. Please correct
> me if I am wrong.
>
>
> Thanks!!!
>
> --
> Ricardo Ribalda
