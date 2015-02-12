From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash
 class extension
Date: Thu, 12 Feb 2015 18:44:44 +0100
Message-ID: <20150212174444.GA9450@amd>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
 <20150211215723.GC11313@amd>
 <54DC671E.8010705@samsung.com>
 <20150212090756.GA30508@amd>
 <54DC7C1E.5020105@samsung.com>
 <20150212105417.GA10377@amd>
 <54DC8B6F.9080802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57235 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061AbbBLRor (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Feb 2015 12:44:47 -0500
Content-Disposition: inline
In-Reply-To: <54DC8B6F.9080802@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com

Hi!

> >>You acked LED Flash class patch, didn't you? :)
> >>
> >>There are many attributes documented in the list fashion, e.g.:
> >>available_frequencies in the Documentation/ABI/testing/sysfs-class-devfreq.
> >
> >No, sorry, you can't do this. We have this parsing nightmare in /proc,
> >before, and we don't want it again.
> >
> >>If we changed this a bit it would be easily parsed with AWK:
> >>
> >>echo "0 none;1 max77693-led1;2 max77693-led2" | awk -F';' '{ for (i=1;
> >>i<=NF; i++) print $i}' | awk '{print $1": "$2}'
> >
> >sysfs is one entry per file. If someone screwed it up in devfreq, it
> >is not reason to screw it up here. (Space separated lists of integers
> >might be acceptable. Fixed strings with one marked by []s happen,
> >too. Maps between ints and names are not.)
> 
> "Fixed strings with one marked by []s happen" - I don't quite
> get this.

root@duo:~# cat /sys/power/state
freeze mem disk
root@duo:~# cat /sys/power/disk
[platform] shutdown reboot suspend
root@duo:~#

> Could you propose the acceptable format then?
> The numbers alone are inconvenient to use, we need a human
> readable description next to them. Or some another way
> to obtain the name.

Files like "0.active", "0.name", "1.active", "1.name"?

Subdirectories 0/1 with "name" and "active" files?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
