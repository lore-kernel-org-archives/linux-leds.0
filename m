From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v7 2/2] leds: lm3601x: Introduce the lm3601x LED driver
Date: Tue, 22 May 2018 07:17:08 -0500
Message-ID: <c5bbffef-5263-f2ff-6394-a14cbc8971b2@ti.com>
References: <20180521180927.18472-1-dmurphy@ti.com>
 <20180521180927.18472-2-dmurphy@ti.com>
 <69a920da-f759-de50-865c-0ebc43044b66@gmail.com>
 <3b20c9cf-5f7e-3ed9-454d-c8e8ca6c0627@ti.com>
 <CAHp75Vf_KaRDJU83d8o1Sy1v+oztucJSYBEK9=cqNw6FQspFvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vf_KaRDJU83d8o1Sy1v+oztucJSYBEK9=cqNw6FQspFvg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Andy

On 05/21/2018 06:05 PM, Andy Shevchenko wrote:
> On Tue, May 22, 2018 at 12:44 AM, Dan Murphy <dmurphy@ti.com> wrote:
> 
> 
>>>> +    child = device_get_next_child_node(&led->client->dev, child);
>>>> +    if (!child) {
>>>> +        dev_err(&led->client->dev, "No LED Child node\n");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = fwnode_property_read_u32(child, "reg", &led->led_mode);
>>>> +    if (ret) {
>>>> +        dev_err(&led->client->dev, "reg DT property missing\n");
>>>> +        goto out_err;
>>>> +    }
>>>> +
>>>> +    if (led->led_mode > LM3601X_LED_TORCH ||
>>>> +        led->led_mode < LM3601X_LED_IR) {
>>>> +        dev_warn(&led->client->dev, "Invalid led mode requested\n");
>>>> +        ret = -EINVAL;
>>>> +        goto out_err;
>>>> +    }
>>>> +
>>>> +    ret = fwnode_property_read_string(child, "label", &name);
>>>> +    if (ret) {
>>>> +        if (led->led_mode == LM3601X_LED_TORCH)
>>>> +            name = "torch";
>>>> +        else
>>>> +            name = "infrared";
>>>> +    }
>>>> +
>>>> +    snprintf(led->led_name, sizeof(led->led_name),
>>>> +        "%s:%s", node->name, name);
>>>
>>> Reading once again my recent explanation regarding this I realized
>>> that I didn't provide clear conclusion, which is: we no longer
>>> use child node name for LED class device name if label is absent.
>>> (apart from that - you're using parent DT node now, i.e.
>>> led-controller).
>>>
>>> Please follow what was done for drivers/leds/leds-cr0014114.c.
>>
>> Hmmm.  If this is calling dev->of_node->name to store the name will this
>> work in non-DT configurations?
> 
> I didn't found this kind of use in linux-next, perhaps I missed something?
> 

Linux next has a different version then what I found doing a search for the driver.

I will change the code to match what is in linux-next.

Dan

> In the driver Jacek referred to I found, though, use of of_node, which
> at some point should be changed to fwnode.
> 
> For now you can fill that if you want to using something like this
> (IIRC it should work):
> 
> if (is_of_node(fwnode))
>  ...->of_node = to_of_node(...);
> 
>> I have not dug to deeply into the fwnode code to find out how the nodes
>> get populated.  So my question may not even be valid.
> 


-- 
------------------
Dan Murphy
