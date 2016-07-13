From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 PROOF OF CONCEPT 2/1] trigger: ledtrig-usbport: read
 initial state from DT
Date: Wed, 13 Jul 2016 16:48:07 +0200
Message-ID: <578654A7.2020909@samsung.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-3-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1468413734-9569-3-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Rafa=C5=82,

On 07/13/2016 02:42 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> This allows specifying USB ports that should be observed by a trigger
> right after activating it. Example:
>
> usb {
> 	gpios =3D <&gpio 0 GPIO_ACTIVE_HIGH>;
> 	linux,default-trigger =3D "usbport";
> 	usb-controllers =3D <&ohci>, <&ehci>, <&xhci USB_HCD_SHARED>;
> 	usb-ports =3D "1", "1", "1";

Port is a numerical value, right?
Wouldn't it be better to define it as an array of integers?

e.g.: usb-ports =3D <1>. <1>, <1>;

> };

Please provide a patch with DT bindings documentation for this
trigger. I infer that usb-controllers and usb-ports are new
properties.

Adding also Felipe, Mark and Rob.

>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/leds/trigger/ledtrig-usbport.c | 72 +++++++++++++++++++++++=
+++++++++++
>   1 file changed, 72 insertions(+)
>
> diff --git a/drivers/leds/trigger/ledtrig-usbport.c b/drivers/leds/tr=
igger/ledtrig-usbport.c
> index eb20a8f..5724f63 100644
> --- a/drivers/leds/trigger/ledtrig-usbport.c
> +++ b/drivers/leds/trigger/ledtrig-usbport.c
> @@ -12,8 +12,10 @@
>   #include <linux/device.h>
>   #include <linux/leds.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/slab.h>
>   #include <linux/usb.h>
> +#include <linux/usb/provider.h>
>   #include "../leds.h"
>
>   struct usbport_trig_port {
> @@ -94,6 +96,75 @@ static bool usbport_trig_match(struct usbport_trig=
_data *usbport_data,
>   	return false;
>   }
>
> +static int usbport_trig_new_port(struct usbport_trig_data *usbport_d=
ata,
> +				 int busnum, const char *suffix)
> +{
> +	struct usbport_trig_port *port;
> +	size_t len;
> +	int tmp;
> +
> +	tmp =3D busnum;
> +	len =3D 1;
> +	while (tmp >=3D 10) {
> +		tmp /=3D 10;
> +		len++;
> +	}
> +	len++; /* '-' */
> +	len +=3D strlen(suffix);
> +	len++; /* '\0' */
> +
> +	port =3D kzalloc(sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->name =3D kzalloc(len, GFP_KERNEL);
> +	if (!port->name) {
> +		kfree(port);
> +		return -ENOMEM;
> +	}
> +	snprintf(port->name, len, "%d-%s", busnum, suffix);
> +
> +	list_add_tail(&port->list, &usbport_data->ports);
> +
> +	return 0;
> +}
> +
> +static int usbport_trig_fill(struct usbport_trig_data *usbport_data)
> +{
> +	struct device_node *np =3D usbport_data->led_cdev->dev->of_node;
> +	struct of_phandle_args args;
> +	int count, i;
> +	int err =3D 0;
> +
> +	if (!np)
> +		return -ENOENT;
> +
> +	count =3D of_property_count_strings(np, "usb-ports");
> +	if (count < 0)
> +		return count;
> +
> +	for (i =3D 0; i < count; i++) {
> +		const char *port;
> +		struct usb_hcd *hcd;
> +
> +		err =3D of_property_read_string_index(np, "usb-ports", i, &port);
> +		if (err)
> +			continue;
> +
> +		err =3D of_parse_phandle_with_args(np, "usb-controllers", "#usb-ce=
lls", i, &args);
> +		if (err)
> +			continue;
> +
> +		hcd =3D of_hcd_get_from_provider(&args);
> +		if (!IS_ERR(hcd))
> +			usbport_trig_new_port(usbport_data, hcd->self.busnum, port);
> +
> +		of_node_put(args.np);
> +	}
> +
> +	return err;
> +}
> +
>   static int usbport_trig_notify(struct notifier_block *nb, unsigned =
long action,
>   			       void *data)
>   {
> @@ -129,6 +200,7 @@ static void usbport_trig_activate(struct led_clas=
sdev *led_cdev)
>   		return;
>   	usbport_data->led_cdev =3D led_cdev;
>   	INIT_LIST_HEAD(&usbport_data->ports);
> +	usbport_trig_fill(usbport_data);
>   	usbport_data->nb.notifier_call =3D usbport_trig_notify,
>   	led_cdev->trigger_data =3D usbport_data;
>
>


--=20
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
