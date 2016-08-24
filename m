From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 05:22:25 -0400
Message-ID: <20160824092225.GB23180@kroah.com>
References: <20160823220404.9887-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160823220404.9887-1-zajec5@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, linux-usb@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Aug 24, 2016 at 12:03:29AM +0200, Rafał Miłecki wrote:
> +static ssize_t ports_show(struct device *dev, struct device_attribute *attr,
> +			  char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct usbport_trig_data *usbport_data = led_cdev->trigger_data;
> +	struct usbport_trig_port *port;
> +	ssize_t ret = 0;
> +	int len;
> +
> +	list_for_each_entry(port, &usbport_data->ports, list) {
> +		len = sprintf(buf + ret, "%s\n", port->name);
> +		if (len >= 0)
> +			ret += len;
> +	}
> +
> +	return ret;
> +}

sysfs is "one value per file", here you are listing a bunch of things in
one sysfs file.  Please don't do that.

greg k-h
