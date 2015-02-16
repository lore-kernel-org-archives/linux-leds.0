From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2] Documentation: leds: Add description of LED Flash
 class extension
Date: Mon, 16 Feb 2015 15:06:10 +0200
Message-ID: <20150216130610.GA3915@valkosipuli.retiisi.org.uk>
References: <1423125773-22751-1-git-send-email-j.anaszewski@samsung.com>
 <20150211215723.GC11313@amd>
 <54DC671E.8010705@samsung.com>
 <20150212090756.GA30508@amd>
 <54DC7C1E.5020105@samsung.com>
 <20150212105417.GA10377@amd>
 <54DC8B6F.9080802@samsung.com>
 <20150212174444.GA9450@amd>
 <54E1D218.6020000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:43002 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755389AbbBPNGq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Mon, 16 Feb 2015 08:06:46 -0500
Content-Disposition: inline
In-Reply-To: <54E1D218.6020000@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com

Hi Jacek,

On Mon, Feb 16, 2015 at 12:18:48PM +0100, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 02/12/2015 06:44 PM, Pavel Machek wrote:
> >Hi!
> >
> >>>>You acked LED Flash class patch, didn't you? :)
> >>>>
> >>>>There are many attributes documented in the list fashion, e.g.:
> >>>>available_frequencies in the Documentation/ABI/testing/sysfs-class-devfreq.
> >>>
> >>>No, sorry, you can't do this. We have this parsing nightmare in /proc,
> >>>before, and we don't want it again.
> >>>
> >>>>If we changed this a bit it would be easily parsed with AWK:
> >>>>
> >>>>echo "0 none;1 max77693-led1;2 max77693-led2" | awk -F';' '{ for (i=1;
> >>>>i<=NF; i++) print $i}' | awk '{print $1": "$2}'
> >>>
> >>>sysfs is one entry per file. If someone screwed it up in devfreq, it
> >>>is not reason to screw it up here. (Space separated lists of integers
> >>>might be acceptable. Fixed strings with one marked by []s happen,
> >>>too. Maps between ints and names are not.)
> >>
> >>"Fixed strings with one marked by []s happen" - I don't quite
> >>get this.
> >
> >root@duo:~# cat /sys/power/state
> >freeze mem disk
> >root@duo:~# cat /sys/power/disk
> >[platform] shutdown reboot suspend
> >root@duo:~#
> >
> >>Could you propose the acceptable format then?
> >>The numbers alone are inconvenient to use, we need a human
> >>readable description next to them. Or some another way
> >>to obtain the name.
> >
> >Files like "0.active", "0.name", "1.active", "1.name"?
> >
> >Subdirectories 0/1 with "name" and "active" files?
> 
> We have flash_sync_strobe attribute which allows to read currently
> chosen sync_led. I would simplify this:
> 
> Let's assume there are two LED Flash class deviecs:
> 
> - max77693-flash1
> - max77693-flash2
> 
> Proposed design described by use cases:
> 
> #cd /sys/class/leds/max77693-flash1
> #cat available_flash_leds
> #[0.none] 1.max77693-flash2
> #cat flash_sync_strobe
> #0.none
> #echo 1 > flash_sync_strobe
> #cat flash_sync_strobe
> #1.max77693-flash2
> #cat available_sync_leds
> #0.none [1.max77693-flash2]

I'd either drop the brackets from the selected LED, or the flash_sync_strobe
attribute in order to avoid redundancy in the interface. I slightly prefer
the former since it's easier to use, but I'm fine with the latter as well.

How about the number and the dot, where do they come from?

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
