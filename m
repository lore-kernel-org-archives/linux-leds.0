From: Alan Mizrahi <alan@mizrahi.com.ve>
Subject: Re: PC Engines APU/APU2 led driver
Date: Mon, 11 Sep 2017 18:45:05 +0900
Message-ID: <24639eb3-9f93-5330-d3da-5b43b35c35f3@mizrahi.com.ve>
References: <1c59aa68-cc27-c577-312a-14f58b62dd89@mizrahi.com.ve>
 <20170911061514.GA25933@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:55900 "EHLO
        mail03.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751111AbdIKJr4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Sep 2017 05:47:56 -0400
In-Reply-To: <20170911061514.GA25933@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

>> static int __init apu_led_init(void)
>> {
>> 	struct platform_device *pdev;
>> 	int err;
>>
>> 	if (!dmi_match(DMI_SYS_VENDOR, "PC Engines")) {
>> 		pr_err("No PC Engines board detected\n");
>> 		return -ENODEV;
>> 	}
>> 	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "APU2"))) {
>> 		printk(KERN_ERR "Unknown PC Engines board: %s\n", dmi_get_system_info(DMI_PRODUCT_NAME));
>> 		return -ENODEV;
>> 	}
>>
>> 	pdev = platform_device_register_simple(KBUILD_MODNAME, -1, NULL, 0);
>> 	if (IS_ERR(pdev)) {
>> 		pr_err("Device allocation failed\n");
>> 		return PTR_ERR(pdev);
>> 	}
>>
>> 	err = platform_driver_probe(&apu_led_driver, apu_led_probe);
>> 	if (err) {
>> 		pr_err("Probe platform driver failed\n");
>> 		platform_device_unregister(pdev);
>> 	}
>>
>> 	return err;
>> }
>>
>> static void __exit apu_led_exit(void)
>> {
>> 	platform_device_unregister(apu_led->pdev);
>> 	platform_driver_unregister(&apu_led_driver);
>> }
> 
> Normally, I'd expect _exit() to be 'reverse' of _init(). That is I'd
> expect reverese order there.

That looked promising, but after inverting the order of the calls in
apu_led_exit(), the problem is still there but with a slightly different
backtrace:

[   11.320368] BUG: unable to handle kernel paging request at
ffffc900000b5618
[   11.327702] IP: [<ffffffff811dd099>] ioread32+0x29/0x30
[   11.333108] PGD 11a00e067 [   11.335708] PUD 11a00f067
PMD 11a014067 [   11.339807] PTE 0
[   11.341783]
[   11.343364] Oops: 0000 [#1] PREEMPT SMP
[   11.347305] Modules linked in: arc4 ath10k_pci ath10k_core ath
mac80211 crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intele
[   11.375310] CPU: 2 PID: 286 Comm: rmmod Not tainted 4.9.47 #37
[   11.381342] Hardware name: PC Engines APU2/APU2, BIOS 4.0.7 02/28/2017
[   11.388091] task: ffff880119af6540 task.stack: ffffc90000184000
[   11.394168] RIP: 0010:[<ffffffff811dd099>]  [<ffffffff811dd099>]
ioread32+0x29/0x30
[   11.402044] RSP: 0018:ffffc90000187e40  EFLAGS: 00010292
[   11.407567] RAX: 0000000000000000 RBX: ffff88011a1e4ac8 RCX:
0000000000001a22
[   11.414966] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
ffffc900000b5618
[   11.422416] RBP: 0000000000000000 R08: 00000000000195a0 R09:
ffff88011ed0e8c0
[   11.429785] R10: ffffea0004686b80 R11: ffff88011a001c00 R12:
0000000000000008
[   11.437184] R13: ffff88011a1ae480 R14: ffff88011a1ae460 R15:
00000000007c5010
[   11.444535] FS:  00007f12f96ec700(0000) GS:ffff88011ed00000(0000)
knlGS:0000000000000000
[   11.452906] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.458842] CR2: ffffc900000b5618 CR3: 0000000115dee000 CR4:
00000000000406e0
[   11.466308] Stack:
[   11.468434]  ffffffffa00d1023 ffff88011a1e4ac8 ffff88011a1e4ba0
ffffffffa005e076
[   11.476255]  ffffc90000187e78 ffff8801196ab810 ffffffff812923c0
ffff880119528dc0
[   11.484073]  ffff88011a1ae4a0 ffff8801196ab810 ffffffffa00d11e8
ffff8801196ab870
[   11.491852] Call Trace:
[   11.494427]  [<ffffffffa00d1023>] ? apu2_led_brightness_set+0x23/0x58
[leds_apu]
[   11.502178]  [<ffffffffa005e076>] ? led_classdev_unregister+0x46/0xa0
[led_class]
[   11.509957]  [<ffffffff812923c0>] ? release_nodes+0xf0/0x1b8
[   11.515889]  [<ffffffff8128f615>] ? __device_release_driver+0x9d/0x140
[   11.522725]  [<ffffffff8128fef4>] ? driver_detach+0xa4/0xb0
[   11.528507]  [<ffffffff8128ed53>] ? bus_remove_driver+0x43/0x98
[   11.534615]  [<ffffffffa00d10a7>] ? apu_led_exit+0xc/0x1b [leds_apu]
[   11.541267]  [<ffffffff810919dc>] ? SyS_delete_module+0x18c/0x1d0
[   11.547653]  [<ffffffff810010b6>] ? exit_to_usermode_loop+0x66/0x70
[   11.554152]  [<ffffffff813fb560>] ? entry_SYSCALL_64_fastpath+0x13/0x94
[   11.560940] Code: 40 00 48 81 ff ff ff 03 00 77 20 48 81 ff 00 00 01
00 76 05 0f b7 d7 ed c3 48 c7 c6 fc df 4d 81 e8 35 ff ff ff b8 ff
[   11.582458] RIP [   11.582797] ath10k_pci 0000:04:00.0: no channel
configured; ignoring frame(s)!
[   11.591649]  [<ffffffff811dd099>] ioread32+0x29/0x30
 RSP <ffffc90000187e40>
[   11.599071] CR2: ffffc900000b5618
[   11.602472] ---[ end trace 138442b63d5d23b3 ]---


Any other ideas?
