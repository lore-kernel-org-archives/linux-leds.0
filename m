From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: How to properly unregister LED class devices?
Date: Mon, 07 Sep 2015 13:28:03 +0200
Message-ID: <55ED74C3.2090409@samsung.com>
References: <20150906174806.GA16230@untxi.home>
 <CA+aCy1FDeTiyXA3cRDEw795xrxrkiZJqgB41c2tXn+NDWpp=jg@mail.gmail.com>
 <20150907090556.GA2549@untxi.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17610 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751255AbbIGL2I (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 07:28:08 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NUB00JF416T9V70@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 07 Sep 2015 12:28:05 +0100 (BST)
In-reply-to: <20150907090556.GA2549@untxi.home>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Cl=E9ment_Vuchener?= <clement.vuchener@gmail.com>
Cc: Pranay Srivastava <pranjas@gmail.com>, kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-leds@vger.kernel.org

Hi Cl=E9ment,

On 09/07/2015 11:05 AM, Cl=E9ment Vuchener wrote:
> On Mon, Sep 07, 2015 at 12:08:17PM +0530, Pranay Srivastava wrote:
>> On Sun, Sep 6, 2015 at 11:18 PM, Cl=E9ment Vuchener
>> <clement.vuchener@gmail.com> wrote:
>>> Hello,
>>>
>>> I am trying to write a driver that uses LED class devices using wor=
ks for setting the LED brightness but I am not sure of how to unregiste=
r the devices.
>>>
>>> I have been using code like this:
>>>          led_classdev_unregister(&drvdata->backlight.cdev);
>>>          cancel_work_sync(&drvdata->backlight.work);
>>> trying with both flush_work or cancel_work_sync as I have seen it i=
n other drivers.
>>>
>>> Using flush_work, the kernel oops in my work function when I unplug=
 the device. cancel_work_sync seems to fix that, but I am not sure it w=
ill work every time. I would like to understand what happens and if I a=
m doing something wrong, to be sure it will not break in some different=
 setup.
>>
>> Can you post the backtrace?
>>
>
> I could not get it with my patched kernel (I must be missing some con=
fig option) so I used the code as a module on my fedora 22 (4.1.6) kern=
el.
>
> general protection fault: 0000 [#1] SMP
> Modules linked in: hid_corsair_k90(OE) bnep bluetooth nf_nat_h323 nf_=
conntrack_h323 nf_nat_pptp nf_nat_proto_gre nf_conntrack_pptp nf_conntr=
ack_proto_g
>   snd_hda_codec_hdmi coretemp arc4 kvm_intel snd_hda_codec_realtek iw=
ldvm kvm snd_hda_codec_generic mac80211 snd_hda_intel snd_hda_controlle=
r snd_hda_co
> CPU: 2 PID: 491 Comm: kworker/2:3 Tainted: G           OE   4.1.6-200=
=2Efc22.x86_64 #1
> Hardware name: CLEVO CO.                        W350ET/W350ET, BIOS 1=
=2E02.21PM v3 07/01/2013
> Workqueue: events k90_record_led_work [hid_corsair_k90]
> task: ffff880223bd4f00 ti: ffff8800c92a0000 task.ti: ffff8800c92a0000
> RIP: 0010:[<ffffffff814e8816>]  [<ffffffff814e8816>] __dev_printk+0x2=
6/0x90
> RSP: 0018:ffff8800c92a3d48  EFLAGS: 00010202
> RAX: 657079740000009d RBX: ffff8801fcee7800 RCX: 000000000001a2e1
> RDX: ffff8800c92a3d58 RSI: ffff8801fcee7800 RDI: ffffffff81a2673f
> RBP: ffff8800c92a3d48 R08: 0000001400730102 R09: ffff8800c92a3d58
> R10: ffffffff81578c4b R11: 0000000000000000 R12: ffff88022f317000
> R13: ffff88022f31b900 R14: 0000000000000080 R15: ffff8801fcc7d320
> FS:  0000000000000000(0000) GS:ffff88022f300000(0000) knlGS:000000000=
0000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000002eee850 CR3: 0000000002c0b000 CR4: 00000000001406e0
> Stack:
>   ffff8800c92a3db8 ffffffff814e8bd2 ffffffffa09701f8 ffff8800c92a3d68
>   ffff880100000010 ffff8800c92a3dc8 ffff8800c92a3d88 000000002440e468
>   0000000000000000 ffff8801fcee7800 00000000ffffffed 000000000001a2e1
> Call Trace:
>   [<ffffffff814e8bd2>] dev_warn+0x62/0x80
>   [<ffffffffa096f44c>] k90_record_led_work+0x8c/0xa0 [hid_corsair_k90=
]
>   [<ffffffff8179da31>] ? __schedule+0x241/0x720
>   [<ffffffff810baadb>] process_one_work+0x1bb/0x410
>   [<ffffffff810baeec>] worker_thread+0x1bc/0x480
>   [<ffffffff810bad30>] ? process_one_work+0x410/0x410
>   [<ffffffff810bad30>] ? process_one_work+0x410/0x410
>   [<ffffffff810c0bf8>] kthread+0xd8/0xf0
>   [<ffffffff810c0b20>] ? kthread_worker_fn+0x180/0x180
>   [<ffffffff817a2322>] ret_from_fork+0x42/0x70
>   [<ffffffff810c0b20>] ? kthread_worker_fn+0x180/0x180
> Code: 00 00 00 00 00 0f 1f 44 00 00 55 48 85 f6 49 89 d1 48 89 e5 74 =
60 4c 8b 46 50 4d 85 c0 74 26 48 8b 86 90 00 00 00 48 85 c0 74 2a <48> =
8b 08 0f be
> RIP  [<ffffffff814e8816>] __dev_printk+0x26/0x90

As your backtrace shows, the problem originates from dev_warn call from
k90_record_led_work. dev_warn takes dev in its first argument, which
is already released at the time when it is called as a result of the
call to flush_work. In order to work this around you could set some
flag on remove to indicate that LED class device has been released
and return from k90_record_led_work immediately.
The same applies to your question regarding retaining the LED state
on remove. Hope this helps.

Is the backtrace always the same? It could likely happen also earlier,
during dereference of dev in the following line:

struct device *dev =3D led->cdev.dev->parent;

--=20
Best Regards,
Jacek Anaszewski
