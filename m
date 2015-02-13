From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Fri, 13 Feb 2015 11:11:43 +0100
Message-ID: <CAPybu_3JaT3QQU+-aX1Vy7=M0QA4kEmn7cDwacZ=Keeg_2Wo6w@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com> <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:38060 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752115AbbBMKMF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 13 Feb 2015 05:12:05 -0500
In-Reply-To: <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hello Bryan

This is a real error message:

[    6.335055] ------------[ cut here ]------------
[    6.335089] WARNING: CPU: 1 PID: 74 at fs/sysfs/dir.c:31
sysfs_warn_dup+0x68/0x80()
[    6.335100] sysfs: cannot create duplicate filename
'/devices/pci0000:00/0000:00:05.0/0000:01:00.0/b0040000.leds/leds/red'
[    6.335108] Modules linked in: qt5023_video(+) qtec_testgen(+)
qtec_white(+) qtec_xform(+) videobuf2_dma_sg gpio_xilinx qtec_mem
videobuf2_vmalloc videobuf2_memops videobuf2_core qtec_cmosis(+)
qtec_pcie 8250_fintek qt5023 spi_xilinx spi_bitbang
[    6.335174] CPU: 1 PID: 74 Comm: kworker/u4:1 Not tainted
3.19.0-qtec-standard+ #161
[    6.335184] Hardware name: QTechnology QT5022/QT5022, BIOS
PM_2.1.0.309 X64 09/27/2013
[    6.335200] Workqueue: deferwq deferred_probe_work_func
[    6.335210]  ffffffff81b4d24a ffff8800878fb8c8 ffffffff8183fb8a
ffffffff81c6bff8
[    6.335225]  ffff8800878fb918 ffff8800878fb908 ffffffff8108555a
00000000000068cf
[    6.335238]  ffff880151a29000 ffff880151251488 ffff8800861a5d98
ffff880151a5e800
[    6.335253] Call Trace:
[    6.335278]  [<ffffffff8183fb8a>] dump_stack+0x4c/0x65
[    6.335298]  [<ffffffff8108555a>] warn_slowpath_common+0x8a/0xc0
[    6.335314]  [<ffffffff810855d6>] warn_slowpath_fmt+0x46/0x50
[    6.335332]  [<ffffffff8120cb38>] ? kernfs_path+0x48/0x60
[    6.335345]  [<ffffffff81210258>] sysfs_warn_dup+0x68/0x80
[    6.335359]  [<ffffffff812102fd>] sysfs_create_dir_ns+0x8d/0xa0
[    6.335375]  [<ffffffff8137a738>] kobject_add_internal+0xb8/0x370
[    6.335468]  [<ffffffff8138226f>] ? string.isra.7+0x3f/0xf0
[    6.335482]  [<ffffffff8137abe3>] kobject_add+0x63/0xb0
[    6.335499]  [<ffffffff81844e59>] ? mutex_lock+0x29/0x50
[    6.335517]  [<ffffffff81452516>] device_add+0xf6/0x5f0
[    6.335533]  [<ffffffff81452c38>] device_create_groups_vargs+0xe8/0x100
[    6.335547]  [<ffffffff81452ce1>] device_create_with_groups+0x31/0x40
[    6.335566]  [<ffffffffa00771ef>] ? xgpio_dir_out+0xbf/0x110 [gpio_xilinx]
[    6.335583]  [<ffffffff813a2f1a>] ? _gpiod_direction_output_raw+0x7a/0x240
[    6.335599]  [<ffffffff81650a30>] led_classdev_register+0x40/0x180
[    6.335613]  [<ffffffff81651ad5>] create_gpio_led+0xe5/0x1a0
[    6.335627]  [<ffffffff81651d5b>] gpio_led_probe+0x1cb/0x390
[    6.335643]  [<ffffffff814579fb>] platform_drv_probe+0x4b/0xc0
[    6.335656]  [<ffffffff81455913>] driver_probe_device+0xa3/0x410
[    6.335670]  [<ffffffff81455c80>] ? driver_probe_device+0x410/0x410
[    6.335682]  [<ffffffff81455cbb>] __device_attach+0x3b/0x40
[    6.335695]  [<ffffffff81453843>] bus_for_each_drv+0x63/0xa0
[    6.335708]  [<ffffffff81455808>] device_attach+0x98/0xb0
[    6.335721]  [<ffffffff81454c20>] bus_probe_device+0xa0/0xc0
[    6.335734]  [<ffffffff81455128>] deferred_probe_work_func+0x38/0xe0
[    6.335750]  [<ffffffff8109cdee>] process_one_work+0x14e/0x410
[    6.335766]  [<ffffffff8109d81b>] worker_thread+0x6b/0x4a0
[    6.335781]  [<ffffffff8109d7b0>] ? init_pwq.part.31+0x10/0x10
[    6.335795]  [<ffffffff810a21bf>] kthread+0xef/0x110
[    6.335807]  [<ffffffff810a0000>] ? alloc_pid+0x150/0x4a0
[    6.335821]  [<ffffffff810a20d0>] ? kthread_create_on_node+0x180/0x180
[    6.335835]  [<ffffffff818473ec>] ret_from_fork+0x7c/0xb0
[    6.335849]  [<ffffffff810a20d0>] ? kthread_create_on_node+0x180/0x180
[    6.335860] ---[ end trace 4f3ef7818083fc76 ]---



-- 
Ricardo Ribalda
