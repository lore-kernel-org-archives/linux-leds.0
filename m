From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds-gpio: Fix error handling and memory leak
Date: Mon, 30 Mar 2015 15:16:12 -0700
Message-ID: <CAK5ve-J=DVHJPMCmWwY4niu59GahU3x=pK0guzhFu1wLJRLEOw@mail.gmail.com>
References: <1425948222-7925-1-git-send-email-minyard@acm.org>
 <CAK5ve-+vwbMhDc-_YE3skwSS0RtCULspzQiYyPwero6a_jFk7w@mail.gmail.com> <5514C9A7.5030304@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:34133 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752661AbbC3WQd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 18:16:33 -0400
In-Reply-To: <5514C9A7.5030304@acm.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: minyard@acm.org
Cc: Raphael Assenat <raph@8d.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Corey Minyard <cminyard@mvista.com>

On Thu, Mar 26, 2015 at 8:08 PM, Corey Minyard <minyard@acm.org> wrote:
> On 03/26/2015 08:20 PM, Bryan Wu wrote:
>> On Mon, Mar 9, 2015 at 5:43 PM,  <minyard@acm.org> wrote:
>>> From: Corey Minyard <cminyard@mvista.com>
>>>
>>> The leds-gpio driver would not clean up properly if it failed in some
>>> places, and it wasn't freeing its private data.
>>>
>>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>>> ---
>>>  drivers/leds/leds-gpio.c | 13 +++++++++----
>>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
>>> index d26af0a..32f7642 100644
>>> --- a/drivers/leds/leds-gpio.c
>>> +++ b/drivers/leds/leds-gpio.c
>>> @@ -198,8 +198,10 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>>>                 } else {
>>>                         if (IS_ENABLED(CONFIG_OF) && !led.name && np)
>>>                                 led.name = np->name;
>>> -                       if (!led.name)
>>> -                               return ERR_PTR(-EINVAL);
>>> +                       if (!led.name) {
>>> +                               ret = -EINVAL;
>>> +                               goto err;
>>> +                       }
>>>                 }
>>>                 fwnode_property_read_string(child, "linux,default-trigger",
>>>                                             &led.default_trigger);
>>> @@ -217,19 +219,21 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>>>                 if (fwnode_property_present(child, "retain-state-suspended"))
>>>                         led.retain_state_suspended = 1;
>>>
>>> -               ret = create_gpio_led(&led, &priv->leds[priv->num_leds++],
>>> +               ret = create_gpio_led(&led, &priv->leds[priv->num_leds],
>> Why need this change? it's correct. And your add one more line
>> "priv->num_leds++"
>
> That's actually the major source of the problem.  The value of
> priv->num_leds was not correct if it failed before this point, and there
> was already one "goto err" above this code and I added another to
> properly handle not allocating the led name.  If it failed there it
> would leave an LED lying around but free the memory underneath it.  So
> instead, modify the failure recovery code to be priv->num_leds-1 instead
> of priv->num_leds-2 and don't increment priv->num_leds until you have
> success.
>
>>>                                       dev, NULL);
>>>                 if (ret < 0) {
>>>                         fwnode_handle_put(child);
>>>                         goto err;
>>>                 }
>>> +               priv->num_leds++;
>> Why need this?
>
> See above.
>
>>>         }
>>>
>>>         return priv;
>>>
>>>  err:
>>> -       for (count = priv->num_leds - 2; count >= 0; count--)
>>> +       for (count = priv->num_leds - 1; count >= 0; count--)
>>>                 delete_gpio_led(&priv->leds[count]);
>>> +       devm_kfree(dev, priv);
>> priv is created by devm_kzalloc(), so if driver probing return error,
>> it will be freed automatically, you don't need call devm_free();
>
> Ah, ok.  Then this is unnecessary.  Do want a new patch?
>

I see, please provide a new patch. I'm going to merge this fix soon.

Thanks,
-Bryan


> Thanks,
>
> -corey
>
>>>         return ERR_PTR(ret);
>>>  }
>>>
>>> @@ -283,6 +287,7 @@ static int gpio_led_remove(struct platform_device *pdev)
>>>
>>>         for (i = 0; i < priv->num_leds; i++)
>>>                 delete_gpio_led(&priv->leds[i]);
>>> +       devm_kfree(&pdev->dev, priv);
>> No need this during remove.
>>
>>>         return 0;
>>>  }
>>> --
>>> 1.8.3.1
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
