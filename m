From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 1/6] leds: Add new API to derive a LED name
Date: Mon, 4 Dec 2017 07:09:00 -0600
Message-ID: <2dbd5060-b63d-7da2-1c4a-6ecbe4c0b8a3@ti.com>
References: <20171201165613.10358-1-dmurphy@ti.com>
 <1c6f0b40-7790-ae94-a65c-d6765c60e4f0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:19277 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753421AbdLDNKB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Dec 2017 08:10:01 -0500
In-Reply-To: <1c6f0b40-7790-ae94-a65c-d6765c60e4f0@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Jacek

On 12/03/2017 07:27 AM, Jacek Anaszewski wrote:
> Dan,
> 
> On 12/01/2017 05:56 PM, Dan Murphy wrote:
>> Create an API that is called to derive the
>> LED name from either the DT label in the child
>> node or if that does not exist from the parent
>> node name and an alternate label that is passed in.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v6 - New patch to add the api to generate a LED label
>>
>>  drivers/leds/led-class.c | 34 ++++++++++++++++++++++++++++++++++
>>  include/linux/leds.h     |  6 ++++++
>>  2 files changed, 40 insertions(+)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index b0e2d55acbd6..d3e035488737 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/leds.h>
>>  #include <linux/list.h>
>>  #include <linux/module.h>
>> +#include <linux/of.h>
>>  #include <linux/slab.h>
>>  #include <linux/spinlock.h>
>>  #include <linux/timer.h>
>> @@ -243,6 +244,39 @@ static int led_classdev_next_name(const char *init_name, char *name,
>>  	return i;
>>  }
>>  
>> +/**
>> + * of_led_compose_name - derive the LED name based on DT or alternate name.
>> + *
>> + * @parent: parent of LED device
>> + * @child: child node of LED device
>> + * @alt_name: an alternate name if the label node is not found
>> + * @len: length of the alt_name
>> + * @led_name: derived name from either DT label or alt_name
>> + */
>> +void of_led_compose_name(struct device_node *parent,
>> +                     struct device_node *child,
>> +		     const char *alt_name,
>> +		     size_t len,
>> +		     char *led_name)
>> +{
>> +	int ret;
>> +	int length;
>> +	const char *name;
>> +
>> +	if (len == 0 || alt_name == NULL)
>> +		return;
>> +
>> +	ret = of_property_read_string(child, "label", &name);
>> +	if (!ret) {
>> +		strlcpy(led_name, name, sizeof(led_name));
>> +	} else {
>> +		length = len + strlen(parent->name) + 1;
>> +		snprintf(led_name, len, "%s:%s", parent->name, alt_name);
>> +	}
> 
> 
> It looks different from what I meant, i.e. that devicename
> segment shouldn't be present in the label, but derived
> from the parent DT node name.
> 
> This is however to be decided whether it wouldn't be better to leave
> the decision to the driver on how to obtain devicename  - from parent
> DT node or from the driver hardcoded string. Some LED class drivers
> prefer the latter way, so if their parent node name differs a bit from
> the string they currently use for devicename, then the resulting
> LED class device name will change after switching to using this
> new API. In order to avoid that we would have to modify related
> DT node names in *.dts files, which would make unnecessary noise.
> 
> Since it may take a while to agree on the final semantics
> of this new API, especially after my recent patch [0], I propose
> to put below piece of code directly in the driver:
> 
> 
> ret = of_property_read_string(child_node, "label", &name);
> if (!ret)
>     snprintf(led->label, sizeof(led->label), "%s:%s",
> 			np->name, name)
> else
>     snprintf(led->label, sizeof(led->label),
>              "%s::%s", np->name, name)
> 
> Please note that "::" means leaving colour section blank,
> because we don't know the LED colour if label DT property was not
> provided.
> 

Just for clarification.

You want me to drop the LED class changes and go back to putting the
LED label generation back in the driver as the code you have above.

And separate out the LP8860 changes.

Dan

<snip>
-- 
------------------
Dan Murphy
