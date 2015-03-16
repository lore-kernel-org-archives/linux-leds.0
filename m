From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Add arbitrary pattern trigger
Date: Mon, 16 Mar 2015 13:20:30 +0100
Message-ID: <20150316122030.GA10642@amd>
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
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50726 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750822AbbCPMUc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Mar 2015 08:20:32 -0400
Content-Disposition: inline
In-Reply-To: <1426500410.11707.6.camel@localhost>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi!

I'd really return error if we can't parse user's input.

Small spelling fixes:

--- drivers/leds/trigger/ledtrig-pattern.c~	2015-03-16 12:07:06.897408622 +0100
+++ drivers/leds/trigger/ledtrig-pattern.c	2015-03-16 13:08:25.801864534 +0100
@@ -38,7 +38,7 @@
 	int nsteps;  /* Number of steps */
 	int repeat;  /* < 0 means repeat indefinitely */
 	struct timer_list timer; /* Used for scheduling updates to
-				    the led brightness */
+				    the LED brightness */
 };
 
 #define MAX_NSTEPS (PAGE_SIZE/4)
@@ -84,7 +84,7 @@
 
 /*
  *  is_sane : pattern checking.
- *  A pattern satisfaying these three conditions is reported as sane :
+ *  A pattern satisfying these three conditions is reported as sane :
  *    - At least two steps
  *    - At least one step with time >= UPDATE_INTERVAL
  *    - At least two steps with differing brightnesses


-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
