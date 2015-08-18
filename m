From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: leds-gpio on x86
Date: Tue, 18 Aug 2015 13:38:50 +0200
Message-ID: <20150818133850.42bb31cf@x2>
References: <20150806173558.GZ1540@lahna.fi.intel.com>
	<20150806201820.5ca0764d@x2>
	<20150807105745.GB1540@lahna.fi.intel.com>
	<20150808140656.6b81d3b9@x2>
	<20150811120038.GF1541@lahna.fi.intel.com>
	<20150811194256.08816c63@x2>
	<20150812125314.GS1541@lahna.fi.intel.com>
	<20150815123640.45a5b9bf@x2>
	<20150817230823.61de477a@x2>
	<20150818093226.3db0b553@x2>
	<20150818090216.GG1552@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:34894 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752660AbbHRLix (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 18 Aug 2015 07:38:53 -0400
Received: by wicne3 with SMTP id ne3so92905147wic.0
        for <linux-leds@vger.kernel.org>; Tue, 18 Aug 2015 04:38:52 -0700 (PDT)
In-Reply-To: <20150818090216.GG1552@lahna.fi.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org, Simon Guinot <simon.guinot@sequanux.org>

(CC'ing gpio-f7188x author)

Discussion summary:
I'm writing a minimal platform driver, declaring 8 GPIO leds and 2 GPIO
input keys. When setting two leds to blink ("timer" trigger) in very
short succession (ie, enable both next to each other in shell script),
kernel emits:

[ 1210.586990] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1211.227414] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1211.867890] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1212.508299] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1213.148734] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1213.789172] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1214.429607] Trying to free nonexistent resource <000000000000002e-000000000000002f>

This is with 500ms on & 500ms off, which matches the aproximate 2
lines/s from this log.
This error goes away when running on a single core.
2e-2f is the f7188x GPIO address range.

On Tue, 18 Aug 2015 12:02:16 +0300, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> For each GPIO operation the f7188x driver calls
> superio_enter()/superio_exit().
> 
> However, I don't think that is enough to prevent multiple threads
> accessing a GPIO at the same time.
> 
> One option is to add mutex to the private structure and then do
> something like this in each callback:
> 
> static int f7188x_gpio_get(...)
> {
> 	mutex_lock(&sio->lock);
> 	
> 	/* request the resource and touch the hardware */
> 
> 	mutex_unlock(&sio->lock);
> 
> 	...
> }
> 
> It is a bit weird that it needs to acquire/release the ioport region each
> time.

There several modules which are using the same two IO addresses for the
many function the SuperIO has, I assumed acquiring the IO range would
prevent them to do any access once the first is loaded.

But as you point out, it seem to not be the case. I also noticed the
fintek-cir driver (for IR sensor, also managed by GPIO) calls
request_region in .probe and release_region() in .remove, which also
goes in this direction.

Regards,
-- 
Vincent Pelletier
