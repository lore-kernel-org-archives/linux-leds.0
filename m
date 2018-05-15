From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 2/2] leds: lm3601x: Introduce the lm3601x LED driver
Date: Wed, 16 May 2018 01:27:12 +0300
Message-ID: <CAHp75Vcytc+=3enLdMVz0Dzf1PH8ZB6fcRxOpW7rgf5vuFU2Zg@mail.gmail.com>
References: <20180515154352.20263-1-dmurphy@ti.com> <20180515154352.20263-2-dmurphy@ti.com>
 <CAHp75VegjkiiD1qTGpi9rr6cg=72t9kSwDrG=sUpUWFVO58M4A@mail.gmail.com>
 <08dda10d-f865-9cf2-b9a5-c79cbab5da98@ti.com> <CAHp75Vcz08zrs3bgMFcvYwRrN_A43D=Nvt5cFDQf8m9whB=yhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vcz08zrs3bgMFcvYwRrN_A43D=Nvt5cFDQf8m9whB=yhA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, May 16, 2018 at 1:24 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, May 16, 2018 at 1:08 AM, Dan Murphy <dmurphy@ti.com> wrote:
>> On 05/15/2018 04:56 PM, Andy Shevchenko wrote:

>>>> +static const struct lm3601x_max_timeouts strobe_timeouts[] = {
>>>> +       { 40000, 0x00 },
>>>> +       { 80000, 0x01 },
>>>> +       { 120000, 0x02 },
>>>> +       { 160000, 0x03 },
>>>> +       { 200000, 0x04 },
>>>> +       { 240000, 0x05 },
>>>> +       { 280000, 0x06 },
>>>> +       { 320000, 0x07 },
>>>> +       { 360000, 0x08 },
>>>> +       { 400000, 0x09 },
>>>> +       { 600000, 0x0a },
>>>> +       { 800000, 0x0b },
>>>> +       { 1000000, 0x0c },
>>>> +       { 1200000, 0x0d },
>>>> +       { 1400000, 0x0e },
>>>> +       { 1600000, 0x0f },

>>> strobe_timeout = (x + 1) * 40 * MSECS_IN_SEC;
>>
>> Not sure what equation you are trying to point out here.  But if you are trying to apply
>> a timeout step you cannot do this with this part.  As pointed out in the DT doc the timeout
>> step is not linear.
>
> Yeah, I know people are more than often too lazy to think.
>
> if (x < 9)
>  strobe_timeout = (x + 1) * 40 * MSECS_IN_SEC;
> else
>  strobe_timeout = (400 + (x - 9) * 200) * MSECS_IN_SEC;

Even just (x - 7) * 200 * ...

-- 
With Best Regards,
Andy Shevchenko
