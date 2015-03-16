From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Add arbitrary pattern trigger
Date: Mon, 16 Mar 2015 12:55:48 +0100
Message-ID: <20150316115547.GA9347@amd>
References: <1424334377.11286.3.camel@localhost>
 <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
 <20150310080042.GA27585@amd>
 <BLU172-W3716E59BC9E98F60F424C4AC180@phx.gbl>
 <20150310192226.GB11260@amd>
 <1426086614.59115.14.camel@localhost>
 <20150311190255.GA20247@amd>
 <1426500410.11707.6.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49922 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399AbbCPLzv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Mar 2015 07:55:51 -0400
Content-Disposition: inline
In-Reply-To: <1426500410.11707.6.camel@localhost>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi!

> Additional testing and comments would be appreciated.

git complains about newline at EOF.

Nice ascii art ;-).

Got this while playing with my hid-sony patches:

[  460.025901] snd_hda_intel 0000:00:1b.0: IRQ timing workaround is
activated for card #0. Suggest a bigger bdl_pos_adj.
[  826.164068] ------------[ cut here ]------------
[  826.164088] WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:535
mutex_lock_nested+0x2ba/0x2d0()
[  826.164092] DEBUG_LOCKS_WARN_ON(in_interrupt())
[  826.164095] Modules linked in:

[  826.164105] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
4.0.0-rc3+ #57
[  826.164109] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW
(2.19 ) 03/31/2011
[  826.164112]  00000000 00000000 f5c1bee0 c486806a f5c1bf0c f5c1befc
c403a42b 00000217
[  826.164130]  c486d8fa ecfb3f44 ecfb3f44 f48b6a10 f5c1bf14 c403a486
00000009 f5c1bf0c
[  826.164146]  c4aa13a9 f5c1bf28 f5c1bf54 c486d8fa c4aa13c1 00000217
c4aa13a9 c4aa139a
[  826.164162] Call Trace:
[  826.164171]  [<c486806a>] dump_stack+0x41/0x52
[  826.164182]  [<c403a42b>] warn_slowpath_common+0x6b/0xa0
[  826.164189]  [<c486d8fa>] ? mutex_lock_nested+0x2ba/0x2d0
[  826.164196]  [<c403a486>] warn_slowpath_fmt+0x26/0x30
[  826.164204]  [<c486d8fa>] mutex_lock_nested+0x2ba/0x2d0
[  826.164213]  [<c461af4d>] pattern_trig_update+0x1d/0xe0
[  826.164221]  [<c408ef20>] ? process_timeout+0x10/0x10
[  826.164228]  [<c461af30>] ? pattern_trig_deactivate+0x60/0x60
[  826.164235]  [<c408ef6f>] call_timer_fn+0x4f/0xc0
[  826.164242]  [<c408ef20>] ? process_timeout+0x10/0x10
[  826.164248]  [<c461af30>] ? pattern_trig_deactivate+0x60/0x60
[  826.164255]  [<c408f781>] run_timer_softirq+0x171/0x210
[  826.164262]  [<c403d384>] __do_softirq+0xd4/0x1c0
[  826.164269]  [<c403d2b0>] ? cpu_callback+0x120/0x120
[  826.164276]  [<c400409d>] do_softirq_own_stack+0x1d/0x30
[  826.164280]  <IRQ>  [<c403d57e>] irq_exit+0x6e/0x90
[  826.164291]  [<c4003a70>] do_IRQ+0x40/0xb0
[  826.164299]  [<c48706b0>] common_interrupt+0x30/0x38
[  826.164307]  [<c45ff30a>] ? cpuidle_enter_state+0x3a/0xe0
[  826.164314]  [<c45ff3cf>] cpuidle_enter+0xf/0x20
[  826.164322]  [<c406c114>] cpu_startup_entry+0x234/0x320
[  826.164331]  [<c4865092>] rest_init+0x92/0xa0
[  826.164341]  [<c4c49ab4>] start_kernel+0x36b/0x372
[  826.164348]  [<c4c492d4>] i386_start_kernel+0x82/0x86
[  826.164352] ---[ end trace a011c72f14dcd310 ]---
[  942.239519] Sony: init

I'd suggest following fix for the documentation.

Thanks,
							Pavel

diff --git a/Documentation/leds/ledtrig-pattern.txt b/Documentation/leds/ledtrig-pattern.txt
index 2db2021..cf14381 100644
--- a/Documentation/leds/ledtrig-pattern.txt
+++ b/Documentation/leds/ledtrig-pattern.txt
@@ -6,7 +6,7 @@ dimming. This trigger can be configured to repeat the pattern a number of
 times or indefinitely. This is intended as a way of communication for embedded
 systems with no screen.
 
-The trigger can be activated from user space on led class devices as shown
+The trigger can be activated from user space on LED class devices as shown
 below:
 
   echo pattern > trigger

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
