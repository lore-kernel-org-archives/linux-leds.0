From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 2/2] leds: lm3601x: Introduce the lm3601x LED driver
Date: Mon, 14 May 2018 22:49:51 +0300
Message-ID: <CAHp75VcFR4zUOhRjNLN1nMirirVaK-WjYa5Kwa9dL__-bjnLuA@mail.gmail.com>
References: <20180510174717.26540-1-dmurphy@ti.com> <20180510174717.26540-2-dmurphy@ti.com>
 <41267191-1308-6b9b-78fa-2893a525b49a@gmail.com> <17630aca-1225-df61-7a5d-a921ecd9c78c@ti.com>
 <86c2bc2f-e622-9447-e4bb-b4ee37e2d44a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86c2bc2f-e622-9447-e4bb-b4ee37e2d44a@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, "Andrew F. Davis" <afd@ti.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, May 14, 2018 at 10:40 PM, Dan Murphy <dmurphy@ti.com> wrote:
> On 05/11/2018 06:56 AM, Dan Murphy wrote:

>>>> +        ret = of_property_read_string(led->strobe_node, "label", &name);

>>>> +        ret = of_property_read_u32(led->strobe_node,

>>>> +        ret = of_property_read_u32(led->strobe_node,

>>> Common LED bindings state that flash-max-microamp and
>>> flash-max-timeout-us properties are mandatory.
>>
>> OK.
>
> OK I looked at the max776973 driver and well if the flash-max-microamp and
> flash-max-timeout-us nodes are missing it sets a default value for each if the
> node is not present.
>
> So should we remove this code from the Max77693 driver too and fail probe as being asked
> in this driver?

I would also add that using device_property_*() API is much better
then using OF specific one. It will help IoT / DIY entusiasts use them
on non-DT platforms.


-- 
With Best Regards,
Andy Shevchenko
