From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Fri, 16 Sep 2016 07:59:27 +0200
Message-ID: <20160916055927.GC13205@amd>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
 <20160915130831.GJ13132@amd>
 <313cbae5-fd66-f0ae-79a9-a3f4273d6f9c@samsung.com>
 <d3f1810c-e97a-4460-1415-f54e8501cf64@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55580 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751081AbcIPF7a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Sep 2016 01:59:30 -0400
Content-Disposition: inline
In-Reply-To: <d3f1810c-e97a-4460-1415-f54e8501cf64@lechnology.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

Hi!

+The current brightness is found by reading a single byte from the
character
+device. Values are unsigned: 0 to 255. Reading does not block and
always returns
+the most recent brightness value. The device node can also be polled
to notify
+when the brightness value changes.

What is going on there? We have O_NONBLOCK, user should be able to
select if he wants blocking behaviour or not.

And yes, there's interface for creating a LED, but not one for
deleting it?

And... how is it going to work with multiple LEDs? Userspace gets
single bytes with brightness. How does it know to which LED the
brightness belongs?

Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
