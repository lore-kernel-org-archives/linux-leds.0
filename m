From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 2/2] leds: lm3601x: Introduce the lm3601x LED driver
Date: Tue, 22 May 2018 22:58:12 +0200
Message-ID: <6577f2f9-7a31-3b98-71e2-2f86818eac7a@gmail.com>
References: <20180522142417.19639-1-dmurphy@ti.com>
 <20180522142417.19639-2-dmurphy@ti.com>
 <CAHp75VfTtD3Mnyqb63R_BP8BoAGNZProLCgWoDMo-aTk5C-iVA@mail.gmail.com>
 <dca52e6e-451c-2ca4-a001-867708622d7b@ti.com>
 <CAHp75Vdg9HTyQhv1KMOCqq5FjgPAC2q015Opnh3jDWvZY2bbNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vdg9HTyQhv1KMOCqq5FjgPAC2q015Opnh3jDWvZY2bbNQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Dan Murphy <dmurphy@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 05/22/2018 10:34 PM, Andy Shevchenko wrote:
> On Tue, May 22, 2018 at 11:26 PM, Dan Murphy <dmurphy@ti.com> wrote:
>> On 05/22/2018 03:12 PM, Andy Shevchenko wrote:
>>> On Tue, May 22, 2018 at 5:24 PM, Dan Murphy <dmurphy@ti.com> wrote:
> 
> 
>>>> +static struct lm3601x_led *fled_cdev_to_led(
>>>> +                               struct led_classdev_flash *fled_cdev)
>>>
>>> Didn't notice before. This will look much better in one line.
>>
>> Gives LTL warning.
> 
> I wouldn't really care about it.
> But I leave to Jacek to decide.

Please make it one line.

It is even Linus' recommendation to not strictly stick to the
80 character limit as we all have modern computers nowadays.

> After addressing the rest, FWIW,
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 

-- 
Best regards,
Jacek Anaszewski
