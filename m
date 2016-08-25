From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Thu, 25 Aug 2016 20:39:24 +0200
Message-ID: <8737lsy9pf.fsf@miraculix.mork.no>
References: <20160823220404.9887-1-zajec5@gmail.com>
        <20160824092225.GB23180@kroah.com>
        <CACna6rxpzN7LrATEQ+Z5tBJrrr6DYVZr37M7qR3WLrWtH_H_bA@mail.gmail.com>
        <20160824210457.GC4305@kroah.com>
        <CACna6rz2YAFjkdmoZw8o29_EjV_z39tnK3osHvKoVHHOyLnXKg@mail.gmail.com>
        <20160825125305.GB15567@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160825125305.GB15567@kroah.com> (Greg KH's message of "Thu, 25
        Aug 2016 08:53:05 -0400")
Sender: linux-doc-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?utf-8?Q?Raf?= =?utf-8?Q?a=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Greg KH <gregkh@linuxfoundation.org> writes:
> On Thu, Aug 25, 2016 at 07:14:52AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>>
>> Good question. I would like to extend this USB port trigger in the
>> future by reacting to USB activity. This involves playing with URBs
>> and I believe that at that point it'd be getting too much USB specific
>> to /rule them all/.
>
> Oh that's never going to work, sorry.  USB "activity" happens deep in
> USB host controller hardware, not up at the kernel level at all.  It's
> just too fast, and would take up too much CPU to do it otherwise.  Heck,
> even old UHCI 1.1 USB controllers did this.
>
> USB "activity" happens all the time, look at a USB bus analyzer if you
> want to see what goes on.  Teasing out what is "real data" and what is
> just "normal bus activity" is impossible at the kernel level,

OK, I am going to play stupid again: Does this mean that usbmon is
impossible?

> and really
> makes no sense at all (your led would just be "on" all the time.)

I don't see how this is any different from e.g. the network activity
triggers.

FWIW, on my system "cat /sys/kernel/debug/usb/usbmon/0u" can be silent
for long periods, and show a rush of lines whenever there is USB
activity.  I imagine that a LED triggered by a hook in a similar place
would be useful on systems with LEDs for that sort of stuff.


Bj=C3=B8rn
