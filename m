From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] leds: leds-gpio: Fix the "default-state" property check
Date: Wed, 10 Dec 2014 02:12:40 +0100
Message-ID: <54879E08.7030108@intel.com>
References: <1418142714-29794-1-git-send-email-fabio.estevam@freescale.com> <CAK5ve-KHd86BxLhk=JC6vspgE7E_W3A3ArrjHsGp41_iuke7fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:9756 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752221AbaLJBM6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 9 Dec 2014 20:12:58 -0500
In-Reply-To: <CAK5ve-KHd86BxLhk=JC6vspgE7E_W3A3ArrjHsGp41_iuke7fA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>
Cc: Grant Likely <grant.likely@linaro.org>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, Fabio Estevam <festevam@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On 12/9/2014 8:13 PM, Bryan Wu wrote:
> On Tue, Dec 9, 2014 at 8:31 AM, Fabio Estevam
> <fabio.estevam@freescale.com> wrote:
>> Commit a43f2cbbb009f9 ("leds: leds-gpio: Make use of device property API")
>> caused a regression by reading the incorrect string for the "default-state"
>> property.
>>
>> Fix the property string check to restore the original behaviour.
>>
>> Fixes: a43f2cbbb009 (leds: leds-gpio: Make use of device property API)
> Thanks, please take my Ack
> Acked-by: Bryan Wu <cooloney@gmail.com>
>
> I think Rafael will take this fix with other patches through his tree.

Yes, I will, thanks!

And sorry for the breakage ...

>
>> Reported-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>> ---
>>   drivers/leds/leds-gpio.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
>> index 8a8ba11..7ea1ea42 100644
>> --- a/drivers/leds/leds-gpio.c
>> +++ b/drivers/leds/leds-gpio.c
>> @@ -203,7 +203,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>>                  fwnode_property_read_string(child, "linux,default-trigger",
>>                                              &led.default_trigger);
>>
>> -               if (!fwnode_property_read_string(child, "linux,default_state",
>> +               if (!fwnode_property_read_string(child, "default-state",
>>                                                   &state)) {
>>                          if (!strcmp(state, "keep"))
>>                                  led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
>> --
>> 1.9.1
>>
