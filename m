From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Fri, 26 Aug 2016 17:38:05 +0200
Message-ID: <CACna6ryGYu_1EUPTSjhuaLnd=ANnjdCXHb1FXaz9P0J87vmRDA@mail.gmail.com>
References: <20160825080546.27182-1-zajec5@gmail.com> <20160825124948.GA15567@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160825124948.GA15567@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 25 August 2016 at 14:49, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Aug 25, 2016 at 10:03:52AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> +static void usbport_trig_activate(struct led_classdev *led_cdev)
>> +{
>> +     struct usbport_trig_data *usbport_data;
>> +     int err;
>> +
>> +     usbport_data =3D kzalloc(sizeof(*usbport_data), GFP_KERNEL);
>> +     if (!usbport_data)
>> +             return;
>> +     usbport_data->led_cdev =3D led_cdev;
>> +
>> +     /* Storing ports */
>> +     INIT_LIST_HEAD(&usbport_data->ports);
>> +     usbport_data->ports_dir =3D kobject_create_and_add("ports",
>> +                                                      &led_cdev->dev->k=
obj);
>
> If you _ever_ find yourself in a driver having to use kobject calls,
> it's a HUGE hint that you are doing something wrong.
>
> Hint, you are doing this wrong :)
>
> Use an attribute group if you need a subdirectory in sysfs, using a
> "raw" kobject like this hides it from all userspace tools and so no
> userspace program can see it (hint, try using libudev to access these
> files attached to the device...)

Oops. Thanks for pointing groups to me. I was looking at sysfs.h
earlier but I didn't realize group can be a subdirectory. I can see
these sysfs_create_group(s) and friends now, thanks.


>> +     if (!usbport_data->ports_dir)
>> +             goto err_free;
>> +
>> +     /* API for ports management */
>> +     err =3D device_create_file(led_cdev->dev, &dev_attr_new_port);
>> +     if (err)
>> +             goto err_put_ports;
>> +     err =3D device_create_file(led_cdev->dev, &dev_attr_remove_port);
>> +     if (err)
>> +             goto err_remove_new_port;
>
> Doesn't this race with userspace and fail?  Shouldn't the led core be
> creating your leds for you?

These questions aren't clear to me. What kind of race? Doing
echo usbport > trigger
results in trigger core calling usbport_trig_activate. We create new
attributes and then we return.

I'm also not creating any leds there. This already has to be LED
available if you want to assign some trigger to it.


>> +
>> +     /* Notifications */
>> +     usbport_data->nb.notifier_call =3D usbport_trig_notify,
>> +     led_cdev->trigger_data =3D usbport_data;
>> +     usb_register_notify(&usbport_data->nb);
>
> Don't abuse the USB notifier chain with stuff like this please, is that
> really necessary?  Why can't your hardware just tell you what USB ports
> are in use "out of band"?

I totally don't understand this part. This LED trigger is supposed to
react to USB devices appearing at specified ports. How else can I know
there is a new USB device if not by notifications?
I'm wondering if we are on the same page. Could it be my idea of this
LED trigger is not clear at all? Could you take a look at commit
message again, please? Mostly this part:
> This commit adds a new trigger responsible for turning on LED when USB
> device gets connected to the specified USB port. This can can useful for
> various home routers that have USB port(s) and a proper LED telling user
> a device is connected.

Can I add something more to make it clear what this trigger is responsible =
for?


>> +
>> +     led_cdev->activated =3D true;
>> +     return;
>> +
>> +err_remove_new_port:
>> +     device_remove_file(led_cdev->dev, &dev_attr_new_port);
>> +err_put_ports:
>> +     kobject_put(usbport_data->ports_dir);
>> +err_free:
>> +     kfree(usbport_data);
>> +}
>
> And again, why is this USB specific?  Why can't you use this same
> userspace api and codebase for PCI ports?  For a sdcard port?  For a
> thunderbolt port?

I'm leaving this one unanswered as discussion on this continued in
V3.5 thread below my reply:
On 25 August 2016 at 07:14, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrot=
e:
> Good question. I would like to extend this USB port trigger in the
> future by reacting to USB activity. This involves playing with URBs
> and I believe that at that point it'd be getting too much USB specific
> to /rule them all/.

--=20
Rafa=C5=82
