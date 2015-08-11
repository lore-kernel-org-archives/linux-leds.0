From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC v5 25/57] leds: pca963x: Remove work queue
Date: Tue, 11 Aug 2015 12:35:50 +0200
Message-ID: <55C9D006.9070104@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
 <1439285890-27329-26-git-send-email-j.anaszewski@samsung.com>
 <CAPybu_3Wt8QCk1oZeNx_0jSLgapLOyyeOfxW3zVkc08mXsgP9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAPybu_3Wt8QCk1oZeNx_0jSLgapLOyyeOfxW3zVkc08mXsgP9A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Peter Meerwald <p.meerwald@bct-electronic.com>
List-Id: linux-leds@vger.kernel.org

Hi Ricardo,

Thanks for the review.

On 08/11/2015 12:00 PM, Ricardo Ribalda Delgado wrote:
> Hello Jacek
>
> Sorry for the late reply.
>
> On Tue, Aug 11, 2015 at 11:37 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>
>
>>   struct pca963x_led {
>>          struct pca963x *chip;
>> -       struct work_struct work;
>>          enum led_brightness brightness;
>>          struct led_classdev led_cdev;
>>          int led_num; /* 0 .. 15 potentially */
>> -       enum pca963x_cmd cmd;
>>          char name[32];
>>          u8 gdc;
>>          u8 gfrq;
>>   };
>
> Maybe you want to remove also brightness, gdc and gfrq and pass them
> as arguments to the functions.
>
>> -static void pca963x_blink_work(struct pca963x_led *pca963x)
>> +static void pca963x_blink(struct pca963x_led *pca963x)
>
> something like: blink(pca963x, gdc, gfrq)

OK, I'll check it.

>
> Big disclaimer: i havent tested it on real hardware. Maybe next week I
> can get hold of a board with a pca chip.
>
>
> BTW: great thing that the work queue is implemented in the core :)

So far it is only in this patch set, but hopefully we will manage
to merge it soon.

-- 
Best Regards,
Jacek Anaszewski
