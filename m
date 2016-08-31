From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Wed, 31 Aug 2016 21:00:09 +0200
Message-ID: <CACna6rysV+zxKBUG49Zpu4oHLWsfCRVLFtmDdbY7NBcCO_676Q@mail.gmail.com>
References: <CACna6rxbUB=jAV+YH-N3hzBU0hbNMY=pdTswVW7h8i4G9g5pmQ@mail.gmail.com>
 <Pine.LNX.4.44L0.1608311420010.1889-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1608311420010.1889-100000@iolanthe.rowland.org>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 31 August 2016 at 20:23, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Tue, 30 Aug 2016, Rafa=C5=82 Mi=C5=82ecki wrote:
>
>> >> As you quite often need more complex LED management, there are
>> >> triggers that were introduced in 2006 by c3bc9956ec52f ("[PATCH] LED:
>> >> add LED trigger tupport"). Some triggers are trivial and could be
>> >> implemented in userspace as well (e.g. "timer"). Some had to be
>> >> implemented in kernelspace (CPU activity, MTD activity, etc.). Having
>> >> few triggers compiled, you can assign them to LEDs at it pleases you.
>> >> Your hardware may have generic LED (not labeled) and you can
>> >> dynamically assign various triggers to it, depending e.g. on user
>> >> actions. E.g. if user (using GUI or whatever) wants to see flash
>> >> activity, your userspace script should do:
>> >> echo mtd > /sys/class/leds/foo/trigger
>> >
>> > So for example, you might want to do:
>> >
>> >         echo usb1-4 >/sys/class/leds/foo/trigger
>> >
>> > and then have the "foo" LED toggle whenever an URB was submitted or
>> > completed for a device attached to the 1-4 port.  Right?
>>
>> Not really as it won't cover some pretty common use cases. Many home
>> routers have few USB ports (2-5) and only 1 USB LED. It has to be
>> possible to assign few USB ports to a single LED (trigger). That way
>> LED should be turned on (and kept on) if there is at least 1 USB
>> device connected. You obviously can't do:
>> echo "usb1-1 usb1-2 usb2-1" > /sys/class/leds/foo/trigger
>>
>> This was already brought up by Rob (who mentioned CPU trigger) and I
>> replied him pretty much the same way in:
>> https://lkml.org/lkml/2016/7/29/38
>> (reply starts with "Anyway, the serious limitation I see").
>
> The code for a bunch of triggers must already be written.  What would
> the user do if he wanted to flash a single LED in response to both
> CPU activity and MTD activity?  If not
>
>         echo "cpu mtd" >/sys/class/leds/foo/trigger
>
> then what?

Well, it sounds like a new feature then. Shall we add an extra API
with a request function for turning LED on? It could internally count
how many requests were raised and keep LED on as long as there is at
least 1 left. I guess we should implement it in trigger "subsystem"
(if I can call it so). Does it sound like a good plan?

--=20
Rafa=C5=82
