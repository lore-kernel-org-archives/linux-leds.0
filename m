From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Thu, 1 Sep 2016 07:25:11 +0200
Message-ID: <CACna6ryCkidVcAAfwmucKSX3jMjHqMGaaV7aD6AZJn6VT3YezQ@mail.gmail.com>
References: <CACna6rxbUB=jAV+YH-N3hzBU0hbNMY=pdTswVW7h8i4G9g5pmQ@mail.gmail.com>
 <Pine.LNX.4.44L0.1608311420010.1889-100000@iolanthe.rowland.org> <CACna6rysV+zxKBUG49Zpu4oHLWsfCRVLFtmDdbY7NBcCO_676Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33329 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750700AbcIAFZl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Sep 2016 01:25:41 -0400
In-Reply-To: <CACna6rysV+zxKBUG49Zpu4oHLWsfCRVLFtmDdbY7NBcCO_676Q@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On 31 August 2016 at 21:00, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrot=
e:
> On 31 August 2016 at 20:23, Alan Stern <stern@rowland.harvard.edu> wrote:
>> On Tue, 30 Aug 2016, Rafa=C5=82 Mi=C5=82ecki wrote:
>>> Not really as it won't cover some pretty common use cases. Many home
>>> routers have few USB ports (2-5) and only 1 USB LED. It has to be
>>> possible to assign few USB ports to a single LED (trigger). That way
>>> LED should be turned on (and kept on) if there is at least 1 USB
>>> device connected. You obviously can't do:
>>> echo "usb1-1 usb1-2 usb2-1" > /sys/class/leds/foo/trigger
>>>
>>> This was already brought up by Rob (who mentioned CPU trigger) and I
>>> replied him pretty much the same way in:
>>> https://lkml.org/lkml/2016/7/29/38
>>> (reply starts with "Anyway, the serious limitation I see").
>>
>> The code for a bunch of triggers must already be written.  What would
>> the user do if he wanted to flash a single LED in response to both
>> CPU activity and MTD activity?  If not
>>
>>         echo "cpu mtd" >/sys/class/leds/foo/trigger
>>
>> then what?
>
> Well, it sounds like a new feature then. Shall we add an extra API
> with a request function for turning LED on? It could internally count
> how many requests were raised and keep LED on as long as there is at
> least 1 left. I guess we should implement it in trigger "subsystem"
> (if I can call it so). Does it sound like a good plan?

I'm pretty sure noone ever planned to have more than 1 trigger
assigned to a single LED. I just realized there will be a problem with
proposed solution: sysfs files conflict.

Consider 2 existing triggers for a moment:
1) oneshot: it creates following sysfs files:
/sys/class/leds/foo/delay_on
/sys/class/leds/foo/delay_off
/sys/class/leds/foo/invert
/sys/class/leds/foo/shot
2) timer: it creates following sysfs files:
/sys/class/leds/foo/delay_on
/sys/class/leds/foo/delay_off

Activating both of them will probably cause a WARNING in sysfs. They
can't coexist :(

We should probably have per-trigger subdirs, e.g.:
/sys/class/leds/foo/trigger-oneshot/delay_on
/sys/class/leds/foo/trigger-oneshot/delay_off
/sys/class/leds/foo/trigger-oneshot/invert
/sys/class/leds/foo/trigger-oneshot/shot
/sys/class/leds/foo/trigger-timer/delay_on
/sys/class/leds/foo/trigger-timer/delay_off
but implementing it now would break the ABI.

One workaround I can see is doing triggers V2, they:
1) Would put sysfs files in /sys/class/leds/foo/trigger-bar/
2) Use new API for *requesting* LED to be on/off
3) There would be a counter of requests in V2 API
4) Multiple triggers V2 would be allowed to be used (assigned) at the same =
time

--=20
Rafa=C5=82
