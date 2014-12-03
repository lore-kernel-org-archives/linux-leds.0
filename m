From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2] leds: leds-gpio: Fix multiple instances registration
 when 'label' property is absent
Date: Wed, 3 Dec 2014 23:16:33 +0000
Message-ID: <CACxGe6t9-pVYG9dXaDsm6soHmUyweAiisO4poFXo4eOxk-a-oA@mail.gmail.com>
References: <1417629453-25719-1-git-send-email-festevam@gmail.com> <CAOMZO5DiKJYM==o5WvVnwimrBVBaCZwWU5Ndi3Ua9YPc_xmKUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:53811 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124AbaLCXQy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 18:16:54 -0500
Received: by mail-ie0-f173.google.com with SMTP id y20so14798487ier.18
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 15:16:53 -0800 (PST)
In-Reply-To: <CAOMZO5DiKJYM==o5WvVnwimrBVBaCZwWU5Ndi3Ua9YPc_xmKUw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Dec 3, 2014 at 7:59 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Wed, Dec 3, 2014 at 3:57 PM, Fabio Estevam <festevam@gmail.com> wrote:
>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>
>> Since commit a43f2cbbb009f96 ("leds: leds-gpio: Make use of device property
>> API") it is no longer possible to register multiple gpio leds without passing
>> the 'label' property.
>>
>> According to Documentation/devicetree/bindings/leds/common.txt:
>>
>> "Optional properties for child nodes:
>> - label : The label for this LED.  If omitted, the label is
>>   taken from the node name (excluding the unit address)."
>>
>> So retrieve the node name when the 'label' property is absent to keep the old
>> behaviour and fix this regression.
>>
>> Reported-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>> ---
>> Changes since v1:
>> - Consider ACPI case as suggested by Grant
>>
>>  drivers/leds/leds-gpio.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
>> index fd53968..8a8ba11 100644
>> --- a/drivers/leds/leds-gpio.c
>> +++ b/drivers/leds/leds-gpio.c
>> @@ -170,6 +170,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>>         struct fwnode_handle *child;
>>         struct gpio_leds_priv *priv;
>>         int count, ret;
>> +       struct device_node *np;
>>
>>         count = device_get_child_node_count(dev);
>>         if (!count)
>> @@ -189,7 +190,16 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>>                         goto err;
>>                 }
>>
>> -               fwnode_property_read_string(child, "label", &led.name);
>> +               np = of_node(child);
>> +
>> +               if (fwnode_property_present(child, "label")) {
>> +                       fwnode_property_read_string(child, "label", &led.name);
>> +               } else {
>> +                       if (IS_ENABLED(CONFIG_OF) && !led.name && np)
>> +                               led.name = np->name;
>> +                       if (!led.name)
>> +                               return ERR_PTR(-EINVAL);
>> +               }
>>                 fwnode_property_read_string(child, "linux,default-trigger",
>
> Or maybe we should not expose the CONFIG_OF versus CONFIG_ACPI
> ifdefery to the driver and do something like this instead:
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index c458458..bdeee26 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -399,6 +399,27 @@ struct fwnode_handle
> *device_get_next_child_node(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(device_get_next_child_node);
>
> +const char *device_get_node_name(struct device *dev, struct
> fwnode_handle *child)
> +{
> +
> +    if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
> +        struct device_node *node = of_node(child);
> +
> +        if (node)
> +            return node->name;
> +    }
> +
> +    if (IS_ENABLED(CONFIG_ACPI)) {
> +        struct acpi_device *node = acpi_node(child);
> +
> +        if (node)
> +            return acpi_dev_name(node);
> +    }
> +
> +    return NULL;
> +}
> +EXPORT_SYMBOL_GPL(device_get_node_name);
> +

Instead of a device_get_* variant, for getting the node, I would
create a fwnode_get_name() helper as it would be usable in a larger
variety of situations. Besides, you've already got the 'child' value
to pass into it.

>  /**
>   * fwnode_handle_put - Drop reference to a device node
>   * @fwnode: Pointer to the device node to drop the reference to.
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index fd53968..c1c472b 100644
>
> diff --git a/include/linux/property.h b/include/linux/property.h
> index a6a3d98..9bec811 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -72,6 +72,8 @@ int fwnode_property_read_string(struct fwnode_handle *fwnode,
>  struct fwnode_handle *device_get_next_child_node(struct device *dev,
>                           struct fwnode_handle *child);
>
> +const char *device_get_node_name(struct device *dev, struct
> fwnode_handle *child);
> +
>  #define device_for_each_child_node(dev, child) \
>      for (child = device_get_next_child_node(dev, NULL); child; \
>           child = device_get_next_child_node(dev, child))
>
> , and then on leds-gpio.c we can simply do:
>
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -189,7 +189,10 @@ static struct gpio_leds_priv
> *gpio_leds_create(struct platform_device *pdev)
>              goto err;
>          }
>
> -        fwnode_property_read_string(child, "label", &led.name);
> +        if (fwnode_property_present(child, "label"))
> +            fwnode_property_read_string(child, "label", &led.name);
> +        else
> +            led.name = device_get_node_name(dev, child);
>          fwnode_property_read_string(child, "linux,default-trigger",
>                          &led.default_trigger);
>
> I am not familiar with ACPI so I don't know if the 'return
> acpi_dev_name(node)' is the appropriate way to retrieve the equivalent
> of a dt node name.

I cannot give good guidance here. I'll leave it to the ACPI folks.

g.
