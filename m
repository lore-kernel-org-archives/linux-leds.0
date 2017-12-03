From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 1/6] leds: Add new API to derive a LED name
Date: Sun, 3 Dec 2017 14:27:01 +0100
Message-ID: <1c6f0b40-7790-ae94-a65c-d6765c60e4f0@gmail.com>
References: <20171201165613.10358-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36764 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751157AbdLCN17 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 3 Dec 2017 08:27:59 -0500
In-Reply-To: <20171201165613.10358-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Dan,

On 12/01/2017 05:56 PM, Dan Murphy wrote:
> Create an API that is called to derive the
> LED name from either the DT label in the child
> node or if that does not exist from the parent
> node name and an alternate label that is passed in.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v6 - New patch to add the api to generate a LED label
> 
>  drivers/leds/led-class.c | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/leds.h     |  6 ++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index b0e2d55acbd6..d3e035488737 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -17,6 +17,7 @@
>  #include <linux/leds.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/timer.h>
> @@ -243,6 +244,39 @@ static int led_classdev_next_name(const char *init_name, char *name,
>  	return i;
>  }
>  
> +/**
> + * of_led_compose_name - derive the LED name based on DT or alternate name.
> + *
> + * @parent: parent of LED device
> + * @child: child node of LED device
> + * @alt_name: an alternate name if the label node is not found
> + * @len: length of the alt_name
> + * @led_name: derived name from either DT label or alt_name
> + */
> +void of_led_compose_name(struct device_node *parent,
> +                     struct device_node *child,
> +		     const char *alt_name,
> +		     size_t len,
> +		     char *led_name)
> +{
> +	int ret;
> +	int length;
> +	const char *name;
> +
> +	if (len == 0 || alt_name == NULL)
> +		return;
> +
> +	ret = of_property_read_string(child, "label", &name);
> +	if (!ret) {
> +		strlcpy(led_name, name, sizeof(led_name));
> +	} else {
> +		length = len + strlen(parent->name) + 1;
> +		snprintf(led_name, len, "%s:%s", parent->name, alt_name);
> +	}


It looks different from what I meant, i.e. that devicename
segment shouldn't be present in the label, but derived
from the parent DT node name.

This is however to be decided whether it wouldn't be better to leave
the decision to the driver on how to obtain devicename  - from parent
DT node or from the driver hardcoded string. Some LED class drivers
prefer the latter way, so if their parent node name differs a bit from
the string they currently use for devicename, then the resulting
LED class device name will change after switching to using this
new API. In order to avoid that we would have to modify related
DT node names in *.dts files, which would make unnecessary noise.

Since it may take a while to agree on the final semantics
of this new API, especially after my recent patch [0], I propose
to put below piece of code directly in the driver:


ret = of_property_read_string(child_node, "label", &name);
if (!ret)
    snprintf(led->label, sizeof(led->label), "%s:%s",
			np->name, name)
else
    snprintf(led->label, sizeof(led->label),
             "%s::%s", np->name, name)

Please note that "::" means leaving colour section blank,
because we don't know the LED colour if label DT property was not
provided.

> +}
> +EXPORT_SYMBOL_GPL(of_led_compose_name);
> +
>  /**
>   * of_led_classdev_register - register a new object of led_classdev class.
>   *
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 5579c64c8fd6..9e18dbe196e2 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -123,6 +123,12 @@ struct led_classdev {
>  	struct mutex		led_access;
>  };
>  
> +extern void of_led_compose_name(struct device_node *parent,
> +                     struct device_node *child,
> +		     const char *alt_name,
> +		     size_t len,
> +		     char *led_name);
> +
>  extern int of_led_classdev_register(struct device *parent,
>  				    struct device_node *np,
>  				    struct led_classdev *led_cdev);
> 

[0] https://patchwork.kernel.org/patch/10089047

-- 
Best regards,
Jacek Anaszewski
