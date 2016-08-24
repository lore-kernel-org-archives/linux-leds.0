From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 11:29:51 +0200
Message-ID: <CACna6rxpzN7LrATEQ+Z5tBJrrr6DYVZr37M7qR3WLrWtH_H_bA@mail.gmail.com>
References: <20160823220404.9887-1-zajec5@gmail.com> <20160824092225.GB23180@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160824092225.GB23180@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 24 August 2016 at 11:22, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Wed, Aug 24, 2016 at 12:03:29AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> +static ssize_t ports_show(struct device *dev, struct device_attribute *=
attr,
>> +                       char *buf)
>> +{
>> +     struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>> +     struct usbport_trig_data *usbport_data =3D led_cdev->trigger_data;
>> +     struct usbport_trig_port *port;
>> +     ssize_t ret =3D 0;
>> +     int len;
>> +
>> +     list_for_each_entry(port, &usbport_data->ports, list) {
>> +             len =3D sprintf(buf + ret, "%s\n", port->name);
>> +             if (len >=3D 0)
>> +                     ret +=3D len;
>> +     }
>> +
>> +     return ret;
>> +}
>
> sysfs is "one value per file", here you are listing a bunch of things in
> one sysfs file.  Please don't do that.

OK. What do you think about creating "ports" subdirectory and creating
file-per-port in it? Then I'd need to bring back something like
"new_port" and "remove_port". Does it sound OK?

--=20
Rafa=C5=82
