From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Tue, 30 Aug 2016 22:28:46 +0200
Message-ID: <CACna6rzmfCi+77k8wtU=UvTGoL+XKhWwE86HNk8Xt8cK6j5zJQ@mail.gmail.com>
References: <20160825080546.27182-1-zajec5@gmail.com> <20160825124948.GA15567@kroah.com>
 <CACna6ryGYu_1EUPTSjhuaLnd=ANnjdCXHb1FXaz9P0J87vmRDA@mail.gmail.com> <20160830120556.GA24151@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36858 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751146AbcH3U2s (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Aug 2016 16:28:48 -0400
In-Reply-To: <20160830120556.GA24151@kroah.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On 30 August 2016 at 14:05, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Fri, Aug 26, 2016 at 05:38:05PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 25 August 2016 at 14:49, Greg KH <gregkh@linuxfoundation.org> wrote:
>> > On Thu, Aug 25, 2016 at 10:03:52AM +0200, Rafa=C5=82 Mi=C5=82ecki wrot=
e:
>> >> +static void usbport_trig_activate(struct led_classdev *led_cdev)
>> >> +{
>> >> +     struct usbport_trig_data *usbport_data;
>> >> +     int err;
>> >> +
>> >> +     usbport_data =3D kzalloc(sizeof(*usbport_data), GFP_KERNEL);
>> >> +     if (!usbport_data)
>> >> +             return;
>> >> +     usbport_data->led_cdev =3D led_cdev;
>> >> +
>> >> +     /* Storing ports */
>> >> +     INIT_LIST_HEAD(&usbport_data->ports);
>> >> +     usbport_data->ports_dir =3D kobject_create_and_add("ports",
>> >> +                                                      &led_cdev->dev=
->kobj);
>> >
>> > If you _ever_ find yourself in a driver having to use kobject calls,
>> > it's a HUGE hint that you are doing something wrong.
>> >
>> > Hint, you are doing this wrong :)
>> >
>> > Use an attribute group if you need a subdirectory in sysfs, using a
>> > "raw" kobject like this hides it from all userspace tools and so no
>> > userspace program can see it (hint, try using libudev to access these
>> > files attached to the device...)
>>
>> Oops. Thanks for pointing groups to me. I was looking at sysfs.h
>> earlier but I didn't realize group can be a subdirectory. I can see
>> these sysfs_create_group(s) and friends now, thanks.
>
> No, use an attribute group, and name it, and the subdir will be created
> automagically for you.

Oh, so I got it wrong again. Thanks for explaining.


>> >> +     if (!usbport_data->ports_dir)
>> >> +             goto err_free;
>> >> +
>> >> +     /* API for ports management */
>> >> +     err =3D device_create_file(led_cdev->dev, &dev_attr_new_port);
>> >> +     if (err)
>> >> +             goto err_put_ports;
>> >> +     err =3D device_create_file(led_cdev->dev, &dev_attr_remove_port=
);
>> >> +     if (err)
>> >> +             goto err_remove_new_port;
>> >
>> > Doesn't this race with userspace and fail?  Shouldn't the led core be
>> > creating your leds for you?
>>
>> These questions aren't clear to me. What kind of race? Doing
>> echo usbport > trigger
>> results in trigger core calling usbport_trig_activate. We create new
>> attributes and then we return.
>
> Why aren't the attributes present when the device is found?  What is
> "trigger" for?
>
>> I'm also not creating any leds there. This already has to be LED
>> available if you want to assign some trigger to it.
>
> That sounds really odd...

Please take a look at Documentation to get some idea of LED triggers:
Documentation/leds/leds-class.txt

Basically a LED (/sys/class/leds/foo/) can be controller with
"brightness" sysfs file like this:
echo 0 > brightness
echo 5 > brightness
echo 255 > brightness
(most LEDs react only 0 and non-0 values).

As you quite often need more complex LED management, there are
triggers that were introduced in 2006 by c3bc9956ec52f ("[PATCH] LED:
add LED trigger tupport"). Some triggers are trivial and could be
implemented in userspace as well (e.g. "timer"). Some had to be
implemented in kernelspace (CPU activity, MTD activity, etc.). Having
few triggers compiled, you can assign them to LEDs at it pleases you.
Your hardware may have generic LED (not labeled) and you can
dynamically assign various triggers to it, depending e.g. on user
actions. E.g. if user (using GUI or whatever) wants to see flash
activity, your userspace script should do:
echo mtd > /sys/class/leds/foo/trigger

I hope it explains things a big and you can see know why trigger code
is independent of creating LEDs. It's about layers and making things
generic I believe.

There is a place for LED driver that is responsible for creating
"struct led_classdev" with proper callback setting brightness. It
provides LED name, but is unaware of the way it should be
lighted/turned off.
There is LED subsystem.
There are triggers that are unaware of LED hardware details and only
set LED brightness using generic API.

I'm obviously not author of all of that and I can't explain some
design decisions, but I hope I gave you a clue how it works.


>> >> +
>> >> +     /* Notifications */
>> >> +     usbport_data->nb.notifier_call =3D usbport_trig_notify,
>> >> +     led_cdev->trigger_data =3D usbport_data;
>> >> +     usb_register_notify(&usbport_data->nb);
>> >
>> > Don't abuse the USB notifier chain with stuff like this please, is tha=
t
>> > really necessary?  Why can't your hardware just tell you what USB port=
s
>> > are in use "out of band"?
>>
>> I totally don't understand this part. This LED trigger is supposed to
>> react to USB devices appearing at specified ports. How else can I know
>> there is a new USB device if not by notifications?
>> I'm wondering if we are on the same page. Could it be my idea of this
>> LED trigger is not clear at all? Could you take a look at commit
>> message again, please? Mostly this part:
>> > This commit adds a new trigger responsible for turning on LED when USB
>> > device gets connected to the specified USB port. This can can useful f=
or
>> > various home routers that have USB port(s) and a proper LED telling us=
er
>> > a device is connected.
>>
>> Can I add something more to make it clear what this trigger is responsib=
le for?
>
> Yes please, as I totally missed that.
>
> And the USB notifier was created for some "special" parts of the USB
> core to use, this feels like an abuse of that in some way.  But it's
> hard to define, I know...

I didn't mean to abuse this USB notifier, can you think of any other
way to achieve the same result? We could think about modifying USB
core to call some symbol from the trigger driver (see usage of
ledtrig_mtd_activity symbol) but is it any better than using
notification block?


>> >> +
>> >> +     led_cdev->activated =3D true;
>> >> +     return;
>> >> +
>> >> +err_remove_new_port:
>> >> +     device_remove_file(led_cdev->dev, &dev_attr_new_port);
>> >> +err_put_ports:
>> >> +     kobject_put(usbport_data->ports_dir);
>> >> +err_free:
>> >> +     kfree(usbport_data);
>> >> +}
>> >
>> > And again, why is this USB specific?  Why can't you use this same
>> > userspace api and codebase for PCI ports?  For a sdcard port?  For a
>> > thunderbolt port?
>>
>> I'm leaving this one unanswered as discussion on this continued in
>> V3.5 thread below my reply:
>> On 25 August 2016 at 07:14, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> w=
rote:
>> > Good question. I would like to extend this USB port trigger in the
>> > future by reacting to USB activity. This involves playing with URBs
>> > and I believe that at that point it'd be getting too much USB specific
>> > to /rule them all/.
>
> No, I mean why not have this specific activity LED work for all types of
> devices, not just USB.
>
> Not that this specific LED works for other types of USB activity.

Sorry, I'm really trying my best, but I may be missing some point. I'm
not sure if I'll answer your question as you expected.

This patch adds only 1 trigger some users may be interested in, user
is still free to assign any trigger he wants to any LED it has on his
hardware. One day I plan to work on more triggers, so user can pick
the one he wants (e.g. when using generic not-labeled LED):
echo none > trigger
echo usbport > trigger
echo foo > trigger

--=20
Rafa=C5=82
