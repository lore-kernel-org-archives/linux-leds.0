From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: leds-gpio on x86
Date: Tue, 18 Aug 2015 09:32:26 +0200
Message-ID: <20150818093226.3db0b553@x2>
References: <20150805220948.3984f19c@x2>
	<20150806165924.GY1540@lahna.fi.intel.com>
	<20150806191727.0bf87a3a@x2>
	<20150806173558.GZ1540@lahna.fi.intel.com>
	<20150806201820.5ca0764d@x2>
	<20150807105745.GB1540@lahna.fi.intel.com>
	<20150808140656.6b81d3b9@x2>
	<20150811120038.GF1541@lahna.fi.intel.com>
	<20150811194256.08816c63@x2>
	<20150812125314.GS1541@lahna.fi.intel.com>
	<20150815123640.45a5b9bf@x2>
	<20150817230823.61de477a@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:38214 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079AbbHRHc3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 18 Aug 2015 03:32:29 -0400
Received: by wicja10 with SMTP id ja10so99973064wic.1
        for <linux-leds@vger.kernel.org>; Tue, 18 Aug 2015 00:32:28 -0700 (PDT)
In-Reply-To: <20150817230823.61de477a@x2>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org

On Mon, 17 Aug 2015 23:08:23 +0200, Vincent Pelletier
<plr.vincent@gmail.com> wrote:
> How can I debug this further ?

I made a bit of progress: disabling all but one cpu (...which, in this
case, just means disabling the second core) makes the error messages go
away, and blinking works fine.

There is a lock taken in __request_region, and released around
schedule() when muxed. I guess this means region request is just pushed
into a queue when resource is busy, then scheduler is told to let
whatever else available run.
I have no idea if the lock should be taken before or after
remove_wait_queue after schedule call.

FWIW:
# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 55
model name      : Intel(R) Celeron(R) CPU  J1800  @ 2.41GHz
stepping        : 8
microcode       : 0x811
cpu MHz         : 2582.817
cache size      : 1024 KB
physical id     : 0
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 11
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 movbe popcnt tsc_deadline_timer rdrand lahf_lm 3dnowprefetch ida arat epb dtherm tpr_shadow vnmi flexpriority ept vpid tsc_adjust smep erms
bugs            :
bogomips        : 4825.60
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

I'm looking for some resource tracing mechanism, but haven't found one
yet. I suspect that there is a driver I haven't identified yet which
would allocate resources incorrectly (or in an incompatible way, at
least).

Regards,
-- 
Vincent Pelletier
