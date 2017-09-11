From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: PC Engines APU/APU2 led driver
Date: Mon, 11 Sep 2017 22:46:22 +0200
Message-ID: <e3573a3b-52ae-b4d6-4e8a-decf201d10e1@gmail.com>
References: <1c59aa68-cc27-c577-312a-14f58b62dd89@mizrahi.com.ve>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:35351 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750853AbdIKUrQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Sep 2017 16:47:16 -0400
Received: by mail-wr0-f175.google.com with SMTP id m18so16967127wrm.2
        for <linux-leds@vger.kernel.org>; Mon, 11 Sep 2017 13:47:15 -0700 (PDT)
In-Reply-To: <1c59aa68-cc27-c577-312a-14f58b62dd89@mizrahi.com.ve>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Mizrahi <alan@mizrahi.com.ve>, linux-leds@vger.kernel.org

Hi Alan,

On 09/11/2017 07:35 AM, Alan Mizrahi wrote:
> Hello,
> 
> I am writing a driver for the leds in PC Engines APU and APU2 boards
> (see the attachment).
> 
> There was an attempt at this before (see
> https://www.spinics.net/lists/linux-leds/msg07904.html), but it was not
> accepted due to several issues.
> So I tried to rewrite it completely, using leds-mlxpld.c as a base, and
> it seems to be working.
> 
> But I'm getting this oops when trying to rmmod the module:
> 
> [52615.090143] BUG: unable to handle kernel paging request at
> ffffc900000c5618
> [52615.097435] IP: [<ffffffff811dd099>] ioread32+0x29/0x30
> [52615.102835] PGD 11a00e067
> [52615.105461] PUD 11a00f067
> [52615.108251] PMD 11a014067
> [52615.109543] PTE 0
> 
> [52615.113072] Oops: 0000 [#1] PREEMPT SMP
> [52615.117150] Modules linked in: ledtrig_heartbeat arc4 ath10k_pci

It seems that you have LED registered on heartbeat trigger events.
In theory releasing LED class driver with active heartbeat trigger
should be safe, but there could be some specific path when removing
a module.

You could try to chase it down with that diagnosis in mind.

Best regards,
Jacek Anaszewski

> ath10k_core ath mac80211 crct10dif_pclmul crc32_pclmul crc32c_intel
> ghash_clmulni_intel aesni_
> intel leds_apu(-) aes_x86_64 lrw gf128mul glue_helper ablk_helper cryptd
> ccp sdhci_pci sdhci cfg80211 mmc_core led_class sha256_generic
> sha1_generic rng_core
> [52615.146823] CPU: 1 PID: 892 Comm: rmmod Not tainted 4.9.47 #37
> [52615.152864] Hardware name: PC Engines APU2/APU2, BIOS 4.0.7 02/28/2017
> [52615.159656] task: ffff880118538b40 task.stack: ffffc90001480000
> [52615.165917] RIP: 0010:[<ffffffff811dd099>]  [<ffffffff811dd099>]
> ioread32+0x29/0x30
> [52615.173967] RSP: 0018:ffffc90001483dd0  EFLAGS: 00010292
> [52615.179479] RAX: 0000000000000000 RBX: ffff8801185292c8 RCX:
> 000000018080007d
> [52615.186933] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
> ffffc900000c5618
> [52615.194342] RBP: 0000000000000000 R08: 0000000000000001 R09:
> ffff88011ec0e8c0
> [52615.201709] R10: ffff88011a004460 R11: ffff88011a001c00 R12:
> 0000000000000008
> [52615.209057] R13: ffff88011a004440 R14: ffff88011a0042c0 R15:
> 00000000024ae010
> [52615.216527] FS:  00007f665d212700(0000) GS:ffff88011ec80000(0000)
> knlGS:0000000000000000
> [52615.224873] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [52615.230828] CR2: ffffc900000c5618 CR3: 00000001180bc000 CR4:
> 00000000000406e0
> [52615.238273] Stack:
> [52615.240306]  ffffffffa0101023 ffff8801185292c8 ffff8801185293a0
> ffffffffa0010076
> [52615.248041]  ffffc90001483e08 ffff8801185f8010 ffffffff812923c0
> ffff88011a312f00
> [52615.255846]  ffff88011a004460 ffff8801185f8010 ffffffffa01011e8
> ffffffff816370e0
> [52615.263610] Call Trace:
> [52615.266136]  [<ffffffffa0101023>] ? apu2_led_brightness_set+0x23/0x58
> [leds_apu]
> [52615.273805]  [<ffffffffa0010076>] ? led_classdev_unregister+0x46/0xa0
> [led_class]
> [52615.281594]  [<ffffffff812923c0>] ? release_nodes+0xf0/0x1b8
> [52615.287483]  [<ffffffff8128f615>] ? __device_release_driver+0x9d/0x140
> [52615.294381]  [<ffffffff8128fe41>] ? device_release_driver+0x19/0x28
> [52615.300799]  [<ffffffff8128eabb>] ? bus_remove_device+0xeb/0x130
> [52615.307016]  [<ffffffff8128bb79>] ? device_del+0x121/0x258
> [52615.312729]  [<ffffffff8129158e>] ? platform_device_del+0x1e/0x70
> [52615.319110]  [<ffffffff812915e9>] ? platform_device_unregister+0x9/0x20
> [52615.325925]  [<ffffffffa01010b1>] ? apu_led_exit+0xf/0x1b [leds_apu]
> [52615.332471]  [<ffffffff810919dc>] ? SyS_delete_module+0x18c/0x1d0
> [52615.338761]  [<ffffffff810010b6>] ? exit_to_usermode_loop+0x66/0x70
> [52615.345245]  [<ffffffff813fb560>] ? entry_SYSCALL_64_fastpath+0x13/0x94
> [52615.352092] Code: 40 00 48 81 ff ff ff 03 00 77 20 48 81 ff 00 00 01
> 00 76 05 0f b7 d7 ed c3 48 c7 c6 fc df 4d 81 e8 35 ff ff ff b8 ff ff ff
> ff c3 <8b> 07 c3 0f 1f 40 00 48 81 fe ff ff 03 00 48 89 f2 77 1f 48 81
> [52615.373340] RIP  [<ffffffff811dd099>] ioread32+0x29/0x30
> [52615.378891]  RSP <ffffc90001483dd0>
> [52615.382547] CR2: ffffc900000c5618
> [52615.385932] ---[ end trace 88328a1715960e7c ]---
> [52615.390731] note: rmmod[892] exited with preempt_count 1
> 
> 
> Any ideas and recommendations would be greatly appreciated.
> 
> Best regards,
> 
> Alan
> 
