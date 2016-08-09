From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: core: add support for HCD providers
Date: Tue, 9 Aug 2016 15:56:33 +0200
Message-ID: <20160809135633.GA2723@kroah.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468326921-26485-2-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468326921-26485-2-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Jul 12, 2016 at 02:35:19PM +0200, Rafał Miłecki wrote:
> When working with Device Tree we may need to reference controllers
> (their nodes) and query for HCDs. This is useful for getting some
> runtime info about host controllers like e.g. assigned bus number.
> 
> Signed-off-by: Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/core/Makefile    |  1 +
>  drivers/usb/core/provider.c  | 79 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/provider.h | 39 ++++++++++++++++++++++
>  3 files changed, 119 insertions(+)
>  create mode 100644 drivers/usb/core/provider.c
>  create mode 100644 include/linux/usb/provider.h
> 
> diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
> index 9780877..20b91d1 100644
> --- a/drivers/usb/core/Makefile
> +++ b/drivers/usb/core/Makefile
> @@ -9,5 +9,6 @@ usbcore-y += port.o of.o
>  
>  usbcore-$(CONFIG_PCI)		+= hcd-pci.o
>  usbcore-$(CONFIG_ACPI)		+= usb-acpi.o
> +usbcore-$(CONFIG_OF)		+= provider.o
>  
>  obj-$(CONFIG_USB)		+= usbcore.o
> diff --git a/drivers/usb/core/provider.c b/drivers/usb/core/provider.c
> new file mode 100644
> index 0000000..4b9165a
> --- /dev/null
> +++ b/drivers/usb/core/provider.c
> @@ -0,0 +1,79 @@
> +#include <linux/slab.h>
> +#include <linux/usb/provider.h>
> +
> +static DEFINE_MUTEX(hcd_provider_mutex);
> +static LIST_HEAD(hcd_provider_list);
> +
> +struct hcd_provider {
> +	struct device_node *np;
> +	struct usb_hcd *(*of_xlate)(struct of_phandle_args *args, void *data);
> +	void *data;
> +	struct list_head list;
> +};
> +
> +struct hcd_provider *of_hcd_provider_register(struct device_node *np,
> +					      struct usb_hcd *(*of_xlate)(struct of_phandle_args *args, void *data),

Typedef for the function pointer?


> +					      void *data)
> +{
> +	struct hcd_provider *hcd_provider;
> +
> +	if (!np)
> +		return ERR_PTR(-EINVAL);

How can that be true?

> +
> +	hcd_provider = kzalloc(sizeof(*hcd_provider), GFP_KERNEL);
> +	if (!hcd_provider)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hcd_provider->np = np;
> +	hcd_provider->of_xlate = of_xlate;
> +	hcd_provider->data = data;
> +
> +	mutex_lock(&hcd_provider_mutex);
> +	list_add_tail(&hcd_provider->list, &hcd_provider_list);
> +	mutex_unlock(&hcd_provider_mutex);
> +
> +	return hcd_provider;
> +}
> +EXPORT_SYMBOL_GPL(of_hcd_provider_register);
> +
> +void of_hcd_provider_unregister(struct hcd_provider *hcd_provider)
> +{
> +	if (IS_ERR(hcd_provider))
> +		return;
> +
> +	mutex_lock(&hcd_provider_mutex);
> +	list_del(&hcd_provider->list);
> +	mutex_unlock(&hcd_provider_mutex);
> +
> +	kfree(hcd_provider);
> +}
> +EXPORT_SYMBOL_GPL(of_hcd_provider_unregister);
> +
> +struct usb_hcd *of_hcd_xlate_simple(struct of_phandle_args *args, void *data)
> +{
> +	if (args->args_count != 0)
> +		return ERR_PTR(-EINVAL);

Huh?

> +	return data;

What is this function for?  Why even have it?

> +}
> +EXPORT_SYMBOL_GPL(of_hcd_xlate_simple);
> +
> +struct usb_hcd *of_hcd_get_from_provider(struct of_phandle_args *args)
> +{
> +	struct usb_hcd *hcd = ERR_PTR(-ENOENT);
> +	struct hcd_provider *provider;
> +
> +	if (!args)
> +		return ERR_PTR(-EINVAL);

How is args not set?

> +
> +	mutex_lock(&hcd_provider_mutex);
> +	list_for_each_entry(provider, &hcd_provider_list, list) {
> +		if (provider->np == args->np) {
> +			hcd = provider->of_xlate(args, provider->data);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&hcd_provider_mutex);
> +
> +	return hcd;
> +}
> +EXPORT_SYMBOL_GPL(of_hcd_get_from_provider);
> diff --git a/include/linux/usb/provider.h b/include/linux/usb/provider.h
> new file mode 100644
> index 0000000..c66e006
> --- /dev/null
> +++ b/include/linux/usb/provider.h
> @@ -0,0 +1,39 @@
> +#ifndef __USB_CORE_PROVIDER_H
> +#define __USB_CORE_PROVIDER_H
> +
> +#include <linux/of.h>
> +#include <linux/usb.h>
> +#include <linux/usb/hcd.h>
> +
> +struct hcd_provider;
> +
> +#ifdef CONFIG_OF
> +struct hcd_provider *of_hcd_provider_register(struct device_node *np,
> +					      struct usb_hcd *(*of_xlate)(struct of_phandle_args *args, void *data),
> +					      void *data);
> +void of_hcd_provider_unregister(struct hcd_provider *hcd_provider);
> +struct usb_hcd *of_hcd_xlate_simple(struct of_phandle_args *args, void *data);
> +struct usb_hcd *of_hcd_get_from_provider(struct of_phandle_args *args);
> +#else
> +static inline
> +struct hcd_provider *of_hcd_provider_register(struct device_node *np,
> +					      struct usb_hcd *(*of_xlate)(struct of_phandle_args *args, void *data),
> +					      void *data)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +static inline void of_hcd_provider_unregister(struct hcd_provider *hcd_provider)
> +{
> +}
> +static inline struct usb_hcd *of_hcd_xlate_simple(struct of_phandle_args *args,
> +						  void *data)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +static inline struct usb_hcd *of_hcd_get_from_provider(struct of_phandle_args *args)
> +{
> +	return NULL;
> +}
> +#endif

Why all of the "of" stuff?  Why not make it generic for any firmware
type (acpi, OF, etc.)?

And I really don't like this, isn't there other ways to get this
information if you really need it?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
