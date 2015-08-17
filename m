From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: leds-gpio on x86
Date: Mon, 17 Aug 2015 23:08:23 +0200
Message-ID: <20150817230823.61de477a@x2>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:37795 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751078AbbHQVI1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 17 Aug 2015 17:08:27 -0400
Received: by wibhh20 with SMTP id hh20so91633044wib.0
        for <linux-leds@vger.kernel.org>; Mon, 17 Aug 2015 14:08:25 -0700 (PDT)
In-Reply-To: <20150815123640.45a5b9bf@x2>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org

I'm getting more comfortable with leds, and troubles begin.
When I enable timer-base led triggering and start even just two leds in
short succession (in a shell script), I start seeing:

[ 1210.586990] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1211.227414] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1211.867890] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1212.508299] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1213.148734] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1213.789172] Trying to free nonexistent resource <000000000000002e-000000000000002f>
[ 1214.429607] Trying to free nonexistent resource <000000000000002e-000000000000002f>

2e-2f is the range of the SuperIO, which is requested & released by
(at least) gpio-f7188x:
[  535.653716] gpio-f7188x: Found f71869a at 0x2e, revision 32

Unloading all other modules accessing the SuperIO (fintek-cir and
f71882fg), I can still reproduce the message.

Also, when this error happens, tty screen can become corrupted (areas
become blank, as if space char was replacing large rectangles).
Unloading my module (which unregisters leds, in turn unregistering GPIO
pins) clears the corruption ("hidden" chars appear again).

Enabling usb-host triggering, the messages appears without a single
other led trigger set to something else than "none".

I do not speak C fluently enough to tell if this is a re-entry kind of
problem (same module accessing GPIO pins right next to each other at
about the same time by different timers).

How can I debug this further ?
-- 
Vincent Pelletier
