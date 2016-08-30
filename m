From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Tue, 30 Aug 2016 23:14:25 +0200
Message-ID: <CACna6rxbUB=jAV+YH-N3hzBU0hbNMY=pdTswVW7h8i4G9g5pmQ@mail.gmail.com>
References: <CACna6rzmfCi+77k8wtU=UvTGoL+XKhWwE86HNk8Xt8cK6j5zJQ@mail.gmail.com>
 <Pine.LNX.4.44L0.1608301644180.1765-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1608301644180.1765-100000@iolanthe.rowland.org>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 30 August 2016 at 22:54, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Tue, 30 Aug 2016, Rafa=C5=82 Mi=C5=82ecki wrote:
>
>> Please take a look at Documentation to get some idea of LED triggers:
>> Documentation/leds/leds-class.txt
>>
>> Basically a LED (/sys/class/leds/foo/) can be controller with
>> "brightness" sysfs file like this:
>> echo 0 > brightness
>> echo 5 > brightness
>> echo 255 > brightness
>> (most LEDs react only 0 and non-0 values).
>>
>> As you quite often need more complex LED management, there are
>> triggers that were introduced in 2006 by c3bc9956ec52f ("[PATCH] LED:
>> add LED trigger tupport"). Some triggers are trivial and could be
>> implemented in userspace as well (e.g. "timer"). Some had to be
>> implemented in kernelspace (CPU activity, MTD activity, etc.). Having
>> few triggers compiled, you can assign them to LEDs at it pleases you.
>> Your hardware may have generic LED (not labeled) and you can
>> dynamically assign various triggers to it, depending e.g. on user
>> actions. E.g. if user (using GUI or whatever) wants to see flash
>> activity, your userspace script should do:
>> echo mtd > /sys/class/leds/foo/trigger
>
> So for example, you might want to do:
>
>         echo usb1-4 >/sys/class/leds/foo/trigger
>
> and then have the "foo" LED toggle whenever an URB was submitted or
> completed for a device attached to the 1-4 port.  Right?

Not really as it won't cover some pretty common use cases. Many home
routers have few USB ports (2-5) and only 1 USB LED. It has to be
possible to assign few USB ports to a single LED (trigger). That way
LED should be turned on (and kept on) if there is at least 1 USB
device connected. You obviously can't do:
echo "usb1-1 usb1-2 usb2-1" > /sys/class/leds/foo/trigger

This was already brought up by Rob (who mentioned CPU trigger) and I
replied him pretty much the same way in:
https://lkml.org/lkml/2016/7/29/38
(reply starts with "Anyway, the serious limitation I see").


>> I hope it explains things a big and you can see know why trigger code
>> is independent of creating LEDs. It's about layers and making things
>> generic I believe.
>>
>> There is a place for LED driver that is responsible for creating
>> "struct led_classdev" with proper callback setting brightness. It
>> provides LED name, but is unaware of the way it should be
>> lighted/turned off.
>> There is LED subsystem.
>> There are triggers that are unaware of LED hardware details and only
>> set LED brightness using generic API.
>>
>> I'm obviously not author of all of that and I can't explain some
>> design decisions, but I hope I gave you a clue how it works.
>
>> >> >> +     /* Notifications */
>> >> >> +     usbport_data->nb.notifier_call =3D usbport_trig_notify,
>> >> >> +     led_cdev->trigger_data =3D usbport_data;
>> >> >> +     usb_register_notify(&usbport_data->nb);
>> >> >
>> >> > Don't abuse the USB notifier chain with stuff like this please, is =
that
>> >> > really necessary?  Why can't your hardware just tell you what USB p=
orts
>> >> > are in use "out of band"?
>> >>
>> >> I totally don't understand this part. This LED trigger is supposed to
>> >> react to USB devices appearing at specified ports. How else can I kno=
w
>> >> there is a new USB device if not by notifications?
>> >> I'm wondering if we are on the same page. Could it be my idea of this
>> >> LED trigger is not clear at all? Could you take a look at commit
>> >> message again, please? Mostly this part:
>> >> > This commit adds a new trigger responsible for turning on LED when =
USB
>> >> > device gets connected to the specified USB port. This can can usefu=
l for
>> >> > various home routers that have USB port(s) and a proper LED telling=
 user
>> >> > a device is connected.
>> >>
>> >> Can I add something more to make it clear what this trigger is respon=
sible for?
>> >
>> > Yes please, as I totally missed that.
>> >
>> > And the USB notifier was created for some "special" parts of the USB
>> > core to use, this feels like an abuse of that in some way.  But it's
>> > hard to define, I know...
>>
>> I didn't mean to abuse this USB notifier, can you think of any other
>> way to achieve the same result? We could think about modifying USB
>> core to call some symbol from the trigger driver (see usage of
>> ledtrig_mtd_activity symbol) but is it any better than using
>> notification block?
>
> I don't think this is such a bad use of the USB notifier.  All you need
> to know is when a device is attached to or unplugged from an LED's
> port.  Neither of these is a very frequent event.
>
> However, there is still the question of how to know when an URB is
> submitted or completed for the device in question.  Obviously the USB
> core would have to call an LED routine.  But how would you determine
> which LED(s) to toggle?  Go through the entire list, looking for ones
> that are bound to the USB device in question?  This seems inefficient.
> Use a hash table?

I was hoping to bring it to discussion later, as it seems even the
basic version of this trigger causes many design problems.

--=20
Rafa=C5=82
