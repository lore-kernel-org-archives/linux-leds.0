From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: Re: [PATCH] leds: leds-fsg: Use devm_led_classdev_register
Date: Tue, 18 Aug 2015 11:16:31 +0530
Message-ID: <CAK-LDbJ+6VnKcsuhRUP13gweetP2p-ioY+ittxDcLqZ5ECxctA@mail.gmail.com>
References: <20150815102101.GA8323@localhost>
	<55D19AD6.8030506@samsung.com>
	<CAK-LDbKBwtq9i3Xozew-axZfPOrgTBKrVHEft4ucLEoohnG_xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:32961 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296AbbHRFqc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 18 Aug 2015 01:46:32 -0400
In-Reply-To: <CAK-LDbKBwtq9i3Xozew-axZfPOrgTBKrVHEft4ucLEoohnG_xw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Aug 17, 2015 at 2:02 PM, Vaishali Thakkar
<vthakkar1994@gmail.com> wrote:
>
> On 17 Aug 2015 13:57, "Jacek Anaszewski" <j.anaszewski@samsung.com> wrote:
>>
>> Hi Vaishali,
>>
>> Thanks for the patch. Unfortunately it causes build break.
>> Please fix the issues and resubmit.
>
> Oops! I am really very sorry. By mistake I sent a basic version of patch
> instead of final one. Thanks for the review.
>
> I'll send v2 with the fix of that build error.

Hi Jacek,

Can you please tell me what are those build errors?
After looking at my patch, I can expect that as I forgot to
remove '.remove         = fsg_led_remove' from structure,
it can cause an error. Also, there is one typing mistake in
function name. So, both of these can be a reason for
breaking a build.

Also to be on safe side, I tried to cross compile it for arm
architecture. But to my surprise, it is not compiling properly.
So, it would be good if you can point me to the script you
used for compilation so that I can check it before sending a new
version.

Thank You.

>>
>> On 08/15/2015 12:21 PM, Vaishali Thakkar wrote:
>>>
>>> Use resource-managed function devm_led_classdev_register instead
>>> of led_classdev_register to make the error-path simpler.
>>>
>>> To be compatible with the change, various gotos are replced with
>>> direct returns and unneeded labels are dropped. Also, remove
>>> fsg_led_remove as it is now redundant.
>>>
>>> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
>>> ---
>>>   drivers/leds/leds-fsg.c | 51
>>> ++++++++++++-------------------------------------
>>>   1 file changed, 12 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
>>> index 2b4dc73..df0e5da 100644
>>> --- a/drivers/leds/leds-fsg.c
>>> +++ b/drivers/leds/leds-fsg.c
>>> @@ -156,60 +156,33 @@ static int fsg_led_probe(struct platform_device
>>> *pdev)
>>>         latch_value = 0xffff;
>>>         *latch_address = latch_value;
>>>
>>> -       ret = led_classdev_register(&pdev->dev, &fsg_wlan_led);
>>> +       ret = devm_led_classdev_register(&pdev->dev, &fsg_wlan_led);
>>>         if (ret < 0)
>>> -               goto failwlan;
>>> +               return ret;
>>>
>>> -       ret = led_classdev_register(&pdev->dev, &fsg_wan_led);
>>> +       ret = devm_led_classdev_register(&pdev->dev, &fsg_wan_led);
>>>         if (ret < 0)
>>> -               goto failwan;
>>> +               return ret;
>>>
>>> -       ret = led_classdev_register(&pdev->dev, &fsg_sata_led);
>>> +       ret = devm_led_classdev_register(&pdev->dev, &fsg_sata_led);
>>>         if (ret < 0)
>>> -               goto failsata;
>>> +               return ret;
>>>
>>> -       ret = led_classdev_register(&pdev->dev, &fsg_usb_led);
>>> +       ret = devm_led_classdev_register(&pdev->dev, &fsg_usb_led);
>>>         if (ret < 0)
>>> -               goto failusb;
>>> +               return ret;
>>>
>>> -       ret = led_classdev_register(&pdev->dev, &fsg_sync_led);
>>> +       ret = devm_classdev_register(&pdev->dev, &fsg_sync_led);
>>>         if (ret < 0)
>>> -               goto failsync;
>>> +               return ret;
>>>
>>> -       ret = led_classdev_register(&pdev->dev, &fsg_ring_led);
>>> +       ret = devm_led_classdev_register(&pdev->dev, &fsg_ring_led);
>>>         if (ret < 0)
>>> -               goto failring;
>>> -
>>> -       return ret;
>>> -
>>> - failring:
>>> -       led_classdev_unregister(&fsg_sync_led);
>>> - failsync:
>>> -       led_classdev_unregister(&fsg_usb_led);
>>> - failusb:
>>> -       led_classdev_unregister(&fsg_sata_led);
>>> - failsata:
>>> -       led_classdev_unregister(&fsg_wan_led);
>>> - failwan:
>>> -       led_classdev_unregister(&fsg_wlan_led);
>>> - failwlan:
>>> +               return ret;
>>>
>>>         return ret;
>>>   }
>>>
>>> -static int fsg_led_remove(struct platform_device *pdev)
>>> -{
>>> -       led_classdev_unregister(&fsg_wlan_led);
>>> -       led_classdev_unregister(&fsg_wan_led);
>>> -       led_classdev_unregister(&fsg_sata_led);
>>> -       led_classdev_unregister(&fsg_usb_led);
>>> -       led_classdev_unregister(&fsg_sync_led);
>>> -       led_classdev_unregister(&fsg_ring_led);
>>> -
>>> -       return 0;
>>> -}
>>> -
>>> -
>>>   static struct platform_driver fsg_led_driver = {
>>>         .probe          = fsg_led_probe,
>>>         .remove         = fsg_led_remove,
>>>
>>
>>
>> --
>> Best Regards,
>> Jacek Anaszewski



-- 
Vaishali
