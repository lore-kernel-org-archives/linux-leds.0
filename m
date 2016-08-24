From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 17:04:57 -0400
Message-ID: <20160824210457.GC4305@kroah.com>
References: <20160823220404.9887-1-zajec5@gmail.com>
 <20160824092225.GB23180@kroah.com>
 <CACna6rxpzN7LrATEQ+Z5tBJrrr6DYVZr37M7qR3WLrWtH_H_bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rxpzN7LrATEQ+Z5tBJrrr6DYVZr37M7qR3WLrWtH_H_bA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Aug 24, 2016 at 11:29:51AM +0200, Rafał Miłecki wrote:
> On 24 August 2016 at 11:22, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Wed, Aug 24, 2016 at 12:03:29AM +0200, Rafał Miłecki wrote:
> >> +static ssize_t ports_show(struct device *dev, struct device_attribute *attr,
> >> +                       char *buf)
> >> +{
> >> +     struct led_classdev *led_cdev = dev_get_drvdata(dev);
> >> +     struct usbport_trig_data *usbport_data = led_cdev->trigger_data;
> >> +     struct usbport_trig_port *port;
> >> +     ssize_t ret = 0;
> >> +     int len;
> >> +
> >> +     list_for_each_entry(port, &usbport_data->ports, list) {
> >> +             len = sprintf(buf + ret, "%s\n", port->name);
> >> +             if (len >= 0)
> >> +                     ret += len;
> >> +     }
> >> +
> >> +     return ret;
> >> +}
> >
> > sysfs is "one value per file", here you are listing a bunch of things in
> > one sysfs file.  Please don't do that.
> 
> OK. What do you think about creating "ports" subdirectory and creating
> file-per-port in it? Then I'd need to bring back something like
> "new_port" and "remove_port". Does it sound OK?

Maybe, I don't know.  Why is "USB" somehow unique here?  Why isn't this
the same for PCI slots/ports?  pccard?  sdcard?  thunderbolt?

thanks,

greg k-h
